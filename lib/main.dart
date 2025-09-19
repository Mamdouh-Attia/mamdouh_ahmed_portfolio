import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamdouh_ahmed_portfolio/core/bloc/app_bloc_observer.dart';
import 'package:mamdouh_ahmed_portfolio/core/utils/logger.dart';
import 'app.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  AppLogger.i('Bloc observer initialized');

  runApp(const MyApp());
}
