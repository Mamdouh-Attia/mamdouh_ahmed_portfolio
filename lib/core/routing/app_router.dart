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
