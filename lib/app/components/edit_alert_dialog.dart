import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/app/controllers/edit_controller.dart';
import 'package:flutter_challenge/app/controllers/products_controller.dart';
import 'package:flutter_challenge/app/widgets/text_form_widget.dart';
import 'package:get/get.dart';

class EditAlertDialog extends StatelessWidget {
  EditAlertDialog({Key? key, required this.indexEdit}) : super(key: key);

  final ProductsController productsController = Get.put<ProductsController>(
    ProductsController(),
  );

  final EditController editController = Get.put<EditController>(
    EditController(),
  );

  final int indexEdit;

  final _formkey = GlobalKey<FormState>();

  final FocusNode _titleFocus = FocusNode();

  final FocusNode _typeFocus = FocusNode();

  final FocusNode _descriptionFocus = FocusNode();

  final FocusNode _priceFocus = FocusNode();

  final FocusNode _ratingFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        'Editar Produto',
        style: TextStyle(
          color: Get.theme.primaryColor,
        ),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormWidget(
                onChangedWidget: editController.setTitle,
                textCapitalizationWidget: TextCapitalization.sentences,
                focusWidget: _titleFocus,
                labelWidget: "Title",
                textInputFormatterWidget: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
                onFieldSubmittedWidget: (title) {
                  _titleFocus.unfocus();
                  FocusScope.of(context).requestFocus(_typeFocus);
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Invalid Title!";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormWidget(
                onChangedWidget: editController.setType,
                focusWidget: _typeFocus,
                labelWidget: "Type",
                textInputFormatterWidget: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
                onFieldSubmittedWidget: (type) {
                  _typeFocus.unfocus();
                  FocusScope.of(context).requestFocus(_descriptionFocus);
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Invalid Type!";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormWidget(
                onChangedWidget: editController.setDescription,
                textCapitalizationWidget: TextCapitalization.sentences,
                focusWidget: _descriptionFocus,
                labelWidget: "Description",
                textInputFormatterWidget: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
                onFieldSubmittedWidget: (description) {
                  _descriptionFocus.unfocus();
                  FocusScope.of(context).requestFocus(_priceFocus);
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Invalid Description!";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormWidget(
                onChangedWidget: editController.setPrice,
                focusWidget: _priceFocus,
                keyboardWidget: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                labelWidget: "Price",
                onFieldSubmittedWidget: (price) {
                  _priceFocus.unfocus();
                  FocusScope.of(context).requestFocus(_ratingFocus);
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Invald Price!";
                  } else if (text.isNotEmpty && double.parse(text) > 1000) {
                    return "Enter a price less than R\$ 1000";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormWidget(
                onChangedWidget: editController.setRating,
                keyboardWidget: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                focusWidget: _ratingFocus,
                labelWidget: "Rating",
                textInputFormatterWidget: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                onFieldSubmittedWidget: (rating) {
                  _ratingFocus.unfocus();
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return "Invald Rating!";
                  } else if (text.isNotEmpty && int.parse(text) > 5) {
                    return "Enter a rating less than 6";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Voltar',
            style: TextStyle(
              color: Get.theme.primaryColor,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            'Salvar',
            style: TextStyle(
              color: Get.theme.primaryColor,
            ),
          ),
          onPressed: () {
            if (_formkey.currentState!.validate()) {
              final Map<String, dynamic> data = {
                "title": editController.title!.trim(),
                "type": editController.type!.trim(),
                "description": editController.description!.trim(),
                "price": double.tryParse(editController.price!),
                "rating": double.tryParse(editController.rating!),
                "created": Timestamp.now(),
              };
              productsController.updateProducts(indexEdit, data);
              productsController.getProductsList();
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
