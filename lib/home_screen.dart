import 'dart:developer';

import 'package:chat_app/supabase_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> tasks = [];
  bool isLoading = false;
  TextEditingController titleController = TextEditingController();

  Future readAllTodos() async {
    SupabaseHelper.client
        .from('todos')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .listen((event) {
          setState(() {
            isLoading = true;
          });
          tasks = event;
          log('event data is: ${event.toString()}');

          setState(() {
            isLoading = false;
          });
        });
  }

  Future insertTodo() async {
    try {
      await SupabaseHelper.client.from('todos').insert({
        'title': titleController.text,
        'isDone': false,
      });
      // readAllTodos();
    } catch (error) {
      log('error is: ${error.toString}');
    }
    titleController.clear();
  }

  Future updateTodo({required bool isDone, required int id}) async {
    try {
      await SupabaseHelper.client
          .from('todos')
          .update({'isDone': isDone})
          .eq('id', id);
      // readAllTodos();
    } catch (error) {
      log('error is: ${error.toString}');
    }
  }

  Future deleteTodo(int id) async {
    try {
      await SupabaseHelper.client.from('todos').delete().eq('id', id);
      // readAllTodos();
    } catch (error) {
      log('error is: ${error.toString}');
    }
  }

  @override
  void initState() {
    super.initState();
    readAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos Screen'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0).copyWith(bottom: 0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                label: const Text('enter todo'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                insertTodo();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text('add', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      itemCount: tasks.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 14),
                      itemBuilder: (context, index) {
                        final item = tasks[index];
                        return Card(
                          child: ListTile(
                            title: Text(
                              item['title'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            leading: Checkbox(
                              value: item['isDone'],
                              onChanged: (value) {
                                updateTodo(isDone: value!, id: item['id']);
                              },
                              activeColor: Colors.teal,
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                deleteTodo(item['id']);
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
