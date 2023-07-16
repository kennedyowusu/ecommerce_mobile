import 'package:ecommerce_ui/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Ecommerce(),
    ),
  );
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce',
      debugShowCheckedModeBanner: false,
      home: ProjectLayout(),
    );
  }
}
