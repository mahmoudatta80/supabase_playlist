import 'package:chat_app/supabase_helper.dart';
import 'package:flutter/material.dart';

import 'storage_example.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StorageExample(),
    );
  }
}
