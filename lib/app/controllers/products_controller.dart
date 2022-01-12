import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/models/products_model.dart';

class ProductsController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<ProductsModel> products = [];

  Future<void> getProducts() async {
    products.clear();

    final QuerySnapshot documents = await firestore
        .collection("products")
        .orderBy('created', descending: true)
        .get();
    for (final doc in documents.docs) {
      products.add(ProductsModel.fromJson(doc));
    }

    notifyListeners();
  }

  Future<void> excludeProducts(int index) async {
    await firestore.collection("products").doc(products[index].id).delete();
    products.removeAt(index);
    notifyListeners();
  }
}
