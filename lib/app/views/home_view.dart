import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/components/products_component.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
      ),
      body: const ProductsComponent(),
    );
  }
}
