import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../models/cart.dart';
import '../../models/product.dart';
import '../widgets/product_widget.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  static const double PADDING = 15.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbarTitle'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () => context.go("/products"),
          icon: Icon(Icons.arrow_back),
        ),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(PADDING),
            child: Row(
              children: [
                Text("Votre panier"),
                Spacer(),
                Text(
                  ref.watch(cartProvider.notifier).priceInEuros,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          if (ref.watch(cartProvider).isEmpty) ...[
            Spacer(),
            Column(
              spacing: PADDING,
              children: [
                Text("Votre panier\nest vide.", textAlign: TextAlign.center),
                Icon(Icons.shopping_cart),
              ],
            ),
            Spacer(),
          ]
          else ...[
            Expanded(
              child: ListView.separated(
                separatorBuilder: (_, _) => Divider(),
                itemCount: ref.watch(cartProvider).length,
                itemBuilder: (context, index) {
                  Product product = ref.watch(cartProvider)[index];
                  return ProductWidget(product: product);
                },
              ),
            ),
          ],
        ],
      ),
      bottomNavigationBar: ref.watch(cartProvider).isNotEmpty ? Container(
        padding: EdgeInsets.all(PADDING),
        width: MediaQuery.of(context).size.width,
        child: FilledButton.icon(
          onPressed: () => {
            context.go("/payment")
          },
          label: Text("Commander"),
          icon: Icon(Icons.checklist),
        ),
      ) : SizedBox(width: 0, height: 0,),
    );
  }
}
