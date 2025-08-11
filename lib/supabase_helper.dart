import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseHelper {
  static const String projectUrl = 'https://hnxckgsucquqqefpuwhw.supabase.co';
  static const String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhueGNrZ3N1Y3F1cXFlZnB1d2h3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ4MzQ2NjAsImV4cCI6MjA3MDQxMDY2MH0.UGwi4EfYFFumTCbNcHGf9rD8J0TUEhn_PVpFJpx8RCo';

  static Future init() async {
    await Supabase.initialize(url: projectUrl, anonKey: apiKey);
  }

  static SupabaseClient get client => Supabase.instance.client;
}
