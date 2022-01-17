import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/components/products_component.dart';
import 'package:flutter_challenge/app/controllers/products_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ProductsController productsController = Get.put<ProductsController>(
    ProductsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          TextButton(
            onPressed: productsController.clearCache,
            child: const Text(
              'Limpar o cache',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
      body: const ProductsComponent(),
    );
  }
}
