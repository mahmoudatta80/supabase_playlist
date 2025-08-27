import 'package:flutter/material.dart';

import 'chat_app.dart';
import 'core/functions/setup_main.dart';

void main() async {
  await setupMain();
  runApp(const ChatApp());
}
