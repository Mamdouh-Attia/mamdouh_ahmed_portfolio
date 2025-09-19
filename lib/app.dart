import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamdouh_ahmed_portfolio/core/routing/app_router.dart';
import 'package:mamdouh_ahmed_portfolio/features/counter/cubit/counter_cubit.dart';
import 'package:mamdouh_ahmed_portfolio/core/theme/cubit/theme_cubit.dart';
import 'package:mamdouh_ahmed_portfolio/core/localization/cubit/language_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
      providers: [
        // Global cubits
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),

        // Local test cubit
        BlocProvider(create: (_) => CounterCubit()),
      ],
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, theme) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Mamdouh Ahmed Portfolio',
            themeMode: theme == AppTheme.dark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(useMaterial3: true),
            theme: ThemeData.light(useMaterial3: true),
            routerConfig: appRouter,
          ),
      ),
    );
}
