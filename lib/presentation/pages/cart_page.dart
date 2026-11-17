import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';
import '../../models/product.dart';
import '../widgets/product_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const double PADDING = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbarTitle'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(PADDING),
            child: Row(
              children: [
                Text("Votre panier"),
                Spacer(),
                Text("O.OO€", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          if (context.watch<Cart>().products.isEmpty) ...[
            Spacer(),
            Column(
              spacing: PADDING,
              children: [
                Text("Votre panier\nest vide.", textAlign: TextAlign.center),
                Icon(Icons.shopping_cart),
              ],
            ),
            Spacer(),
          ] else ...[
            ListView.separated(
              separatorBuilder: (_, _) => Divider(),
              itemCount: context.watch<Cart>().products.length,
              itemBuilder: (context, index) {
                Product product = context.watch<Cart>().products[index];
                return ProductWidget(product: product);
              },
            ),
          ],
        ],
      ),
    );
  }
}
