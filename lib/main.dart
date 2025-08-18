import 'package:flutter/material.dart';

import 'chat_app.dart';
import 'core/helpers/supabase_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseHelper().init();
  runApp(const ChatApp());
}
