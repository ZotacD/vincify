import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vincify/models/product.dart';

import '../../models/cart.dart';

class ProductWidget extends ConsumerWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            {ref.read(cartProvider.notifier).remove(product)}
          else
            {ref.read(cartProvider.notifier).add(product)},
        },
        child: Text(
          GoRouterState.of(context).uri.path == '/cart'
              ? "RETIRER"
              : "AJOUTER",
        ),
      ),
    );
  }
}
