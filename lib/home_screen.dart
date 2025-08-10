import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> tasks = [
    {'title': 'Go to gym', 'id': 1, 'isDone': false},
    {'title': 'Back from gym', 'id': 2, 'isDone': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0).copyWith(bottom: 0),
        child: Column(
          children: [
            TextFormField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                label: const Text('enter todo'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text('add', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
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
                        onChanged: (value) {},
                        activeColor: Colors.teal,
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 14),
                itemCount: tasks.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
