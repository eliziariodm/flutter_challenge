import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_challenge/app/models/products_model.dart';

class ProductsRepository {
  final FirebaseFirestore firestore;

  ProductsRepository({required this.firestore});

  Future<List<ProductsModel>> getProducts() {
    return firestore.collection("products").orderBy("created").get().then(
          (value) => value.docs.map(
            (doc) {
              return ProductsModel.fromJson(doc);
            },
          ).toList(),
        );
  }
}
