import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vincify/data/product_client.dart';
import 'package:vincify/models/product.dart';

import '../../models/cart.dart';

class ProductPage extends StatelessWidget {
  final String id;

  const ProductPage({required this.id, super.key});

  static const double PADDING = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbarTitle'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder(
        future: fetchProduct(id),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData && asyncSnapshot.data != null) {
            final product = asyncSnapshot.data!;
            return SafeArea(
              child: Column(
                children: [
                  Image.network(
                    product.image,
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    fit: BoxFit.contain,
                  ),

                  Container(
                    padding: const EdgeInsets.all(PADDING),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 50,
                          children: [
                            Expanded(
                              child: Text(
                                product.title,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              product.getPrice(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Divider(),
                        Text(product.description),
                        Divider(),
                        Badge(
                          label: Text(product.category),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary,
                        ),
                        if (context.watch<Cart>().contains(product)) ...[
                          Divider(),
                          Chip(label: Text("Déjà présent dans le panier")),
                        ],
                      ],
                    ),
                  ),

                  Spacer(),

                  Container(
                    padding: EdgeInsets.all(PADDING),
                    width: MediaQuery.of(context).size.width,
                    child: OutlinedButton.icon(
                      onPressed: () => {context.read<Cart>().add(product)},
                      label: Text("Ajouter au panier"),
                      icon: Icon(Icons.add_shopping_cart),
                    ),
                  ),
                ],
              ),
            );
          } else if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Center(child: Text("Produit introuvable"));
        },
      ),
    );
  }
}
