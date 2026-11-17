import 'dart:convert';

import 'package:http/http.dart';

import '../models/product.dart';

Future<List<Product>> fetchProducts() async {
  final response = await get(Uri.parse("https://fakestoreapi.com/products"));

  if (response.statusCode == 200) {
    final List<dynamic> products = json.decode(response.body);
    return products
        .map((product) => Product.fromMap(product as Map<String, dynamic>))
        .toList();
  }
  return Future.error("Erreur de connexion");
  // Je veux récupérer les données de l'API
}

Future<Product> fetchProduct(String id) async {
  final response = await get(Uri.parse("https://fakestoreapi.com/products/$id"));

  if (response.statusCode == 200) {
    final dynamic product = json.decode(response.body);
    return Product.fromMap(product);
  }
  return Future.error("Erreur de connexion");
  // Je veux récupérer les données de l'API
}