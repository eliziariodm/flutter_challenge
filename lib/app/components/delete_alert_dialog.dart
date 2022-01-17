import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/controllers/products_controller.dart';
import 'package:get/get.dart';

class DeleteAlertDialog extends StatelessWidget {
  DeleteAlertDialog({Key? key, required this.indexEdit}) : super(key: key);

  final ProductsController productsController = Get.put<ProductsController>(
    ProductsController(),
  );

  final int indexEdit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Get.theme.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: const Text(
        'Tem certeza que deseja excluir esse produto?',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Sim',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            productsController.deleteProducts(indexEdit);
            Navigator.of(context).pop();
            productsController.productsIsDelete(
              onSuccess: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                      ),
                      backgroundColor: Get.theme.primaryColor,
                      title: const Text(
                        "Pronto!",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      content: const Text(
                        'Produto deletado com sucesso',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text(
                            "OK",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              onFail: (e) {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                      ),
                      backgroundColor: Get.theme.primaryColor,
                      title: const Text(
                        "Atenção",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      content: Text(
                        e,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text(
                            "OK",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
        TextButton(
          child: const Text(
            'Não',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
