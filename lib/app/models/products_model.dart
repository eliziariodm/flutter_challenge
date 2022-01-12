import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsModel {
  String? id;
  String? title;
  String? type;
  String? rating;
  String? price;
  String? image;
  Timestamp? created;

  ProductsModel({
    this.id,
    this.title,
    this.type,
    this.rating,
    this.price,
    this.created,
  });

  ProductsModel.fromJson(DocumentSnapshot doc) {
    id = doc.id;
    title = (doc.data() as dynamic)['title'] as String?;
    type = (doc.data() as dynamic)['type'] as String?;
    rating = (doc.data() as dynamic)['rating'] as String?;
    price = (doc.data() as dynamic)['price'] as String?;
    image = (doc.data() as dynamic)['image'] as String?;
    created = (doc.data() as dynamic)['created'] as Timestamp?;
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "type": type,
      "rating": rating,
      "price": price,
      "image": image,
      "created": created,
    };
  }

  @override
  String toString() {
    return 'ProductsModel{id: $id, title: $title, type: $type, rating: $rating, price: $price, image: $image, created: $created}';
  }
}
