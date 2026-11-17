import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vincify/data/product_client.dart';
import 'package:vincify/presentation/pages/cart_page.dart';
import 'package:vincify/presentation/pages/product_page.dart';
import 'package:vincify/presentation/pages/products_page.dart';

import 'models/product.dart';

class Vincify extends StatelessWidget {
  Vincify({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: "/products",
    routes: <GoRoute>[
      GoRoute(
        path: "/products",
        builder: (BuildContext context, GoRouterState state) {
          return ProductsPage();
        },
        routes: [
          GoRoute(
            path: "/:index",
            builder: (BuildContext context, GoRouterState state) {
              final index = state.pathParameters["index"];
              if (index == null) {
                return Scaffold(
                  appBar: AppBar(title: Text('Erreur')),
                  body: Center(child: Text("Produit introuvable")),
                );
              }

              return ProductPage(id: index);
            },
          ),
        ],
      ),
      GoRoute(path: "/cart", builder: (context, state) => CartPage()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Vincify",
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
