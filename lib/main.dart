import 'package:ecommerce_ui/layout.dart';
import 'package:ecommerce_ui/views/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    ProviderScope(
      child: Ecommerce(),
    ),
  );
}

class Ecommerce extends ConsumerWidget {
  Ecommerce({super.key});

  final String title = 'E-commerce';
  final GetStorage storage = GetStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: storage.hasData('token') ? ProjectLayout() : LoginView(),
    );
  }
}
