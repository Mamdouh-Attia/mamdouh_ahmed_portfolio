import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamdouh_ahmed_portfolio/core/theme/cubit/theme_cubit.dart';
import 'package:mamdouh_ahmed_portfolio/core/localization/cubit/language_cubit.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Mamdouh Attia'),
        actions: [
          IconButton(
            tooltip: 'Toggle Theme',
            icon: const Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          ),
          IconButton(
            tooltip: 'Toggle Language',
            icon: const Icon(Icons.language),
            onPressed: () => context.read<LanguageCubit>().toggleLanguage(),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text('Navigation')),
            ListTile(
              title: const Text('Home'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/'),
            ),
            ListTile(
              title: const Text('Projects'),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed('/projects'),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/about'),
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed('/contact'),
            ),
            ListTile(
              title: const Text('Other'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/other'),
            ),
          ],
        ),
      ),
      body: SafeArea(child: child),
      bottomNavigationBar: Container(
        height: 56,
        alignment: Alignment.center,
        child: const Text('©  Mamdouh Attia'),
      ),
    );
}
