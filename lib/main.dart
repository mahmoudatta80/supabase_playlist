import 'package:chat_app/core/utils/app_secure_storage.dart';
import 'package:chat_app/core/utils/dependency_injection.dart';
import 'package:flutter/material.dart';

import 'chat_app.dart';
import 'core/helpers/supabase_helper.dart';
import 'core/utils/app_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseHelper().init();
  await setupGetIt();
  await AppSecureStorage().init();
  await AppSharedPreferences().init();
  runApp(const ChatApp());
}
