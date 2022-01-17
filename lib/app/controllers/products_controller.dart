import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/repositories/products_repository.dart';
import 'package:get/get.dart';
import 'package:flutter_challenge/app/models/products_model.dart';

class ProductsController extends GetxController {
  ProductsRepository repository =
      ProductsRepository(firestore: FirebaseFirestore.instance);

  bool isLoading = false;

  List<ProductsModel> products = [];

  Future<List<ProductsModel>> getProductsList() async {
    isLoading = true;
    products.clear();
    update();
    products = await repository.getProducts();
    isLoading = false;
    update();

    return products;
  }

  Future<List<ProductsModel>> updateProducts(
      int index, Map<String, dynamic> data) async {
    isLoading = true;
    update();
    await repository.firestore
        .collection('products')
        .doc(products[index].id)
        .update(data);
    isLoading = false;
    update();

    return products;
  }

  Future<List<ProductsModel>> deleteProducts(int index) async {
    isLoading = true;
    update();
    await repository.firestore
        .collection('products')
        .doc(products[index].id)
        .delete();
    products.removeAt(index);
    isLoading = false;
    update();

    return products;
  }

  Future<void> productsIsDelete({
    required Function onSuccess,
    required Function(String) onFail,
  }) async {
    isLoading = true;
    update();
    try {
      await onSuccess();
      isLoading = false;
      update();
    } catch (e) {
      await onFail(e.toString());
      isLoading = false;
      update();
    }
  }

  void clearCache() {
    imageCache!.clear();
    imageCache!.clearLiveImages();
    update();
  }

  @override
  void onInit() {
    getProductsList();
    super.onInit();
  }
}
