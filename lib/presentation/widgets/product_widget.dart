import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vincify/models/product.dart';

import '../../models/cart.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.go('/products/${product.id}', extra: product);
      },
      leading: Image.network(product.image, width: 80, height: 80),
      title: Text(
        product.title,
        style: Theme.of(context).textTheme.bodyMedium,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        product.getPrice(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: TextButton(
        onPressed: () => {
          if (GoRouterState.of(context).uri.path == '/cart')
            {context.read<Cart>().remove(product)}
          else
            {context.read<Cart>().add(product)},
        },
        child: Text(
          GoRouterState.of(context).uri.path == '/cart'
              ? "SUPPRIMER"
              : "AJOUTER",
        ),
      ),
    );
  }
}
