import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String _kSupabaseUrlFromDefine = String.fromEnvironment('SUPABASE_URL');
const String _kSupabaseAnonFromDefine = String.fromEnvironment(
  'SUPABASE_ANON_KEY',
);

class SupabaseService {
  static String get supabaseUrl {
    if (_kSupabaseUrlFromDefine.isNotEmpty) return _kSupabaseUrlFromDefine;
    return dotenv.env['SUPABASE_URL'] ?? '';
  }

  static String get supabaseAnonKey {
    if (_kSupabaseAnonFromDefine.isNotEmpty) return _kSupabaseAnonFromDefine;
    return dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  }

  static Future<void> initialize() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  }

  static SupabaseClient get client => Supabase.instance.client;
}
