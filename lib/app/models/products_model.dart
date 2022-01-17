import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsModel {
  String? id;
  String? title;
  String? type;
  String? description;
  double? height;
  double? width;
  num? rating;
  num? price;
  String? filename;
  Timestamp? created;

  ProductsModel({
    this.id,
    this.title,
    this.type,
    this.description,
    this.height,
    this.width,
    this.rating,
    this.price,
    this.filename,
    this.created,
  });

  ProductsModel.fromJson(DocumentSnapshot doc) {
    id = doc.id;
    title = (doc.data() as dynamic)['title'] as String?;
    type = (doc.data() as dynamic)['type'] as String?;
    description = (doc.data() as dynamic)['description'] as String?;
    height = (doc.data() as dynamic)['height'] * 1.0 as double?;
    width = (doc.data() as dynamic)['width'] * 1.0 as double?;
    rating = (doc.data() as dynamic)['rating'] as num?;
    price = (doc.data() as dynamic)['price'] as num?;
    filename = (doc.data() as dynamic)['filename'] as String?;
    created = (doc.data() as dynamic)['created'] as Timestamp?;
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "type": type,
      "description": description,
      "height": height,
      "width": width,
      "rating": rating,
      "price": price,
      "filename": filename,
      "created": created,
    };
  }

  @override
  String toString() {
    return 'ProductsModel{id: $id, title: $title, type: $type, description: $description, height: $height, width: $width, rating: $rating, price: $price, filename: $filename, created: $created}';
  }
}
