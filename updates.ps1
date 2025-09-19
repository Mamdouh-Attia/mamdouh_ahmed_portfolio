# updates.ps1
# Generates AppShell + basic placeholder pages and updates the router.
# Run from project root: .\updates.ps1

function Write-ToFile($path, $content) {
    $folder = Split-Path $path
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
    }
    Set-Content -Path $path -Value $content -Encoding UTF8
    Write-Host "Updated: $path"
}

# 1) AppShell
$appShell = @"
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamdouh_ahmed_portfolio/core/theme/cubit/theme_cubit.dart';
import 'package:mamdouh_ahmed_portfolio/core/localization/cubit/language_cubit.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onTap: () => Navigator.of(context).pushReplacementNamed('/projects'),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/about'),
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/contact'),
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
        child: const Text('© ${DateTime.now().year} Mamdouh Attia'),
      ),
    );
  }
}
"@
Write-ToFile "lib/core/widgets/app_shell.dart" $appShell

# 2) HomePage
$homePage = @"
import 'package:flutter/material.dart';
import 'package:mamdouh_ahmed_portfolio/core/widgets/app_shell.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(
      child: Center(child: Text('Home — Welcome to Mamdouh Portfolio')),
    );
  }
}
"@
Write-ToFile "lib/features/home/presentation/home_page.dart" $homePage

# 3) ProjectsPage
$projects = @"
import 'package:flutter/material.dart';
import 'package:mamdouh_ahmed_portfolio/core/widgets/app_shell.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(
      child: Center(child: Text('Projects — Grid + Filters + Search (placeholder)')),
    );
  }
}
"@
Write-ToFile "lib/features/projects/presentation/projects_page.dart" $projects

# 4) ProjectDetailPage
$projectDetail = @"
import 'package:flutter/material.dart';
import 'package:mamdouh_ahmed_portfolio/core/widgets/app_shell.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(
      child: Center(child: Text('Project Detail — placeholder')),
    );
  }
}
"@
Write-ToFile "lib/features/projects/presentation/project_detail_page.dart" $projectDetail

# 5) AboutPage
$about = @"
import 'package:flutter/material.dart';
import 'package:mamdouh_ahmed_portfolio/core/widgets/app_shell.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(
      child: Center(child: Text('About — Bio, Skills, Teaching')),
    );
  }
}
"@
Write-ToFile "lib/features/about/presentation/about_page.dart" $about

# 6) ContactPage
$contact = @"
import 'package:flutter/material.dart';
import 'package:mamdouh_ahmed_portfolio/core/widgets/app_shell.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(
      child: Center(child: Text('Contact — Email / Social links / Form (placeholder)')),
    );
  }
}
"@
Write-ToFile "lib/features/contact/presentation/contact_page.dart" $contact

# 7) OtherProjectsPage
$other = @"
import 'package:flutter/material.dart';
import 'package:mamdouh_ahmed_portfolio/core/widgets/app_shell.dart';

class OtherProjectsPage extends StatelessWidget {
  const OtherProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(
      child: Center(child: Text('Other Projects — Explorations & Tools')),
    );
  }
}
"@
Write-ToFile "lib/features/other/presentation/other_projects_page.dart" $other

# 8) Update router
$appRouter = @"
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mamdouh_ahmed_portfolio/features/home/presentation/home_page.dart';
import 'package:mamdouh_ahmed_portfolio/features/projects/presentation/projects_page.dart';
import 'package:mamdouh_ahmed_portfolio/features/projects/presentation/project_detail_page.dart';
import 'package:mamdouh_ahmed_portfolio/features/about/presentation/about_page.dart';
import 'package:mamdouh_ahmed_portfolio/features/contact/presentation/contact_page.dart';
import 'package:mamdouh_ahmed_portfolio/features/other/presentation/other_projects_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/projects', builder: (context, state) => const ProjectsPage()),
    GoRoute(path: '/projects/:id', builder: (context, state) => const ProjectDetailPage()),
    GoRoute(path: '/about', builder: (context, state) => const AboutPage()),
    GoRoute(path: '/contact', builder: (context, state) => const ContactPage()),
    GoRoute(path: '/other', builder: (context, state) => const OtherProjectsPage()),
  ],
);
"@
Write-ToFile "lib/core/routing/app_router.dart" $appRouter

Write-Host "All done. Now run: flutter pub get && flutter run -d chrome"
