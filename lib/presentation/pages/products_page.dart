import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vincify/data/product_client.dart';
import 'package:vincify/models/cart.dart';
import 'package:vincify/presentation/widgets/product_widget.dart';

import '../../models/product.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbarTitle'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => context.go("/cart"),
            icon: Badge.count(
              count: ref.watch(cartProvider).length,
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchProducts(),
        builder: (context, asyncSnapshot) {
          print(asyncSnapshot);
          if (asyncSnapshot.hasData && asyncSnapshot.data != null) {
            final products = asyncSnapshot.data!;
            return ListView.separated(
              separatorBuilder: (_, _) => Divider(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];
                return ProductWidget(product: product);
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
