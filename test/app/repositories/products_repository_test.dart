import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_challenge/app/repositories/products_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {
  test('O teste deve retornar a lista de produtos.', () async {
    final firestore = FakeFirebaseFirestore();
    final productsRepository = ProductsRepository(firestore: firestore);

    await firestore.collection("products").add({
      "title": "Brown eggs",
      "type": "dairy",
      "description": "Raw organic brown eggs in a basket",
      "filename": "0.jpg",
      "height": 600.0,
      "width": 400.0,
      "price": 28.1,
      "rating": 4,
      'created': FieldValue.serverTimestamp(),
    });
    final listProducts = await productsRepository.getProducts();
    expect(listProducts.isNotEmpty, equals(true));
  });
}
