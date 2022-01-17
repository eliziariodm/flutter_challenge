import 'package:get/get.dart';

class EditController extends GetxController {
  String? title;
  void setTitle(String setTitle) {
    title = setTitle;
    update();
  }

  String? type;
  void setType(String setType) {
    type = setType;
    update();
  }

  String? description;
  void setDescription(String setDescription) {
    description = setDescription;
    update();
  }

  String? price;
  void setPrice(String setPrice) {
    price = setPrice;
    update();
  }

  String? rating;
  void setRating(String setRating) {
    rating = setRating;
    update();
  }
}
