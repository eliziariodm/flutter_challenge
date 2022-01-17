import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/components/edit_component.dart';
import 'package:flutter_challenge/app/controllers/products_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductsComponent extends StatelessWidget {
  const ProductsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GetBuilder<ProductsController>(
        init: ProductsController(),
        builder: (productsController) {
          if (productsController.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
              ),
            );
          } else if (productsController.products.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Não há nenhum produto para visualizar',
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: productsController.products.length,
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.21,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth * 0.24,
                        child: ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            topLeft: Radius.circular(8),
                          ),
                          child: CachedNetworkImage(
                            key: UniqueKey(),
                            imageUrl:
                                productsController.products[index].filename ??
                                    '',
                            height: productsController.products[index].height,
                            width: productsController.products[index].width,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Colors.black26,
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.black26,
                              child: const Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            width: constraints.maxWidth * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    productsController.products[index].title ??
                                        '',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                EditComponent(
                                  indexEdit: index,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 12),
                            width: constraints.maxWidth * 0.7,
                            child: Text(
                              productsController.products[index].type ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            width: constraints.maxWidth * 0.72,
                            child: Text(
                              productsController.products[index].description ??
                                  '',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: constraints.maxWidth * 0.45,
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: List.generate(
                                    5,
                                    (indicator) => indicator <
                                            productsController
                                                .products[index].rating!
                                        ? Icon(
                                            Icons.star,
                                            color: Colors.yellow[600],
                                          )
                                        : Icon(
                                            Icons.star_border,
                                            color: Colors.yellow[600],
                                          ),
                                  ),
                                ),
                              ),
                              Text(
                                'R\$ ${productsController.products[index].price}',
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              DateFormat('dd/MM/yyyy HH:mm').format(
                                  productsController.products[index].created!
                                      .toDate()),
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
