import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const double PADDING = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('appbarTitle'), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(PADDING),
            child: Row(children: [Text("Votre panier"), Spacer(), Text("O.OO€", style: TextStyle(fontWeight: FontWeight.bold),)],),
          ),
          Spacer(),
          Column(
            spacing: PADDING,
            children: [
              Text("Votre panier\nest vide.", textAlign: TextAlign.center),
              Icon(Icons.shopping_cart),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
