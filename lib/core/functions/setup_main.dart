import 'package:flutter/material.dart';

import '../helpers/supabase_helper.dart';
import '../utils/app_secure_storage.dart';
import '../utils/app_shared_preferences.dart';
import '../utils/dependency_injection.dart';

Future<void> setupMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseHelper().init();
  await AppSecureStorage().init();
  await AppSharedPreferences().init();
  await setupGetIt();
}
