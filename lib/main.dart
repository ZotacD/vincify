import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vincify/app.dart';
import 'package:vincify/models/cart.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => Cart(),
      child: Vincify(),
    ),
  );
}
