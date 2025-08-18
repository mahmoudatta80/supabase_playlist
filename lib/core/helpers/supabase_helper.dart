import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHelper {
  SupabaseHelper._();
  static final SupabaseHelper _instance = SupabaseHelper._();
  factory SupabaseHelper() => _instance;

  final String supabaseUrl = 'https://eglzdtkjbattuqpnswue.supabase.co';
  final String supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVnbHpkdGtqYmF0dHVxcG5zd3VlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTU1Mjc1MDIsImV4cCI6MjA3MTEwMzUwMn0.FdY82EujRcUAyLFdiIny4fJIoIsfQIKNkIieWbeb53Q';

  Future<void> init() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  }

  SupabaseClient get client => Supabase.instance.client;
}
