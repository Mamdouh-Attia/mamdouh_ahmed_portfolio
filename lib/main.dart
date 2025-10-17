import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mamdouh_ahmed_portfolio/core/bloc/app_bloc_observer.dart';
import 'package:mamdouh_ahmed_portfolio/core/utils/logger.dart';

import 'app.dart';
import 'shared/services/supabase_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  try {
    await dotenv.load();
  } catch (_) {
    await dotenv.load(fileName: '.env.example');
  }

  AppLogger.i('Environment variables loaded');

  await SupabaseService.initialize();
  Bloc.observer = AppBlocObserver();
  AppLogger.i('Bloc observer initialized');
  runApp(const MyApp());
}
