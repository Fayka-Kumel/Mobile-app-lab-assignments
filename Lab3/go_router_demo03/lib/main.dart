import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          // Navigate using the route name instead of path
          onPressed: () => context.goNamed('details'),
          child: const Text('Go to Details'),
        ),
      ), 
    ); 
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Center(child: Text('This is the details screen!')),
    ); // Scaffold
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'go_router Lesson 3',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}


void main() => runApp(const MyApp());

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', name: 'home', builder: (_, _) => const HomeScreen()),
    GoRoute(path: '/details', name: 'details', builder: (_, _) => const DetailsScreen()),
  ],
);

