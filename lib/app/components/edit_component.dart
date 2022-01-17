import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/components/delete_alert_dialog.dart';
import 'package:flutter_challenge/app/components/edit_alert_dialog.dart';
import 'package:flutter_challenge/app/controllers/edit_controller.dart';
import 'package:flutter_challenge/app/controllers/products_controller.dart';
import 'package:get/get.dart';

class EditComponent extends StatelessWidget {
  EditComponent({Key? key, required this.indexEdit}) : super(key: key);

  final ProductsController productsController = Get.put<ProductsController>(
    ProductsController(),
  );

  final int indexEdit;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditController>(
      init: EditController(),
      builder: (editController) => PopupMenuButton(
        iconSize: 30,
        icon: const Icon(Icons.more_horiz),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: const Text(
              'Editar',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              Future.delayed(
                Duration.zero,
                () => showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => EditAlertDialog(indexEdit: indexEdit),
                ),
              );
            },
          ),
          PopupMenuItem(
            child: const Text(
              'Excluir',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              Future.delayed(
                Duration.zero,
                () => showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => DeleteAlertDialog(indexEdit: indexEdit),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
