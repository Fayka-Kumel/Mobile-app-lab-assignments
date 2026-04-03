import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Router configuration
final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/product/:id', // path parameter
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final filter = state.uri.queryParameters['filter'] ?? 'all';
        return ProductDetailScreen(id: id, filter: filter);
      },
    ),
  ],
);

// HomeScreen with navigation using path & query params
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          // Navigates with both path and query parameters
          onPressed: () => context.go('/product/42?filter=popular'),
          child: const Text('Go to Product 42'),
        ),
      ), // Center
    ); // Scaffold
  }
}

// ProductDetailScreen that receives parameters
class ProductDetailScreen extends StatelessWidget {
  final String id;
  final String filter;

  const ProductDetailScreen({
    super.key,
    required this.id,
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $id')),
      body: Center(
        child: Text('Showing product $id\nFilter: $filter'),
      ), // Center
    ); // Scaffold
  }
}


// App widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'go_router Lesson 2',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

// Entry point
void main() => runApp(const MyApp());