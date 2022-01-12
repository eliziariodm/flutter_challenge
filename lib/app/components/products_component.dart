import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductsComponent extends StatefulWidget {
  const ProductsComponent({Key? key}) : super(key: key);

  @override
  _ProductsComponentState createState() => _ProductsComponentState();
}

class _ProductsComponentState extends State<ProductsComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.18,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.09,
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://picsum.photos/250?image=9',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, top: 7),
                    width: MediaQuery.of(context).size.width * 0.837,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '2',
                          style: TextStyle(fontSize: 14),
                        ),
                        PopupMenuButton(
                          iconSize: 30,
                          icon: const Icon(Icons.more_horiz),
                          itemBuilder: (context) => const [
                            PopupMenuItem(
                              child: Text(
                                'Editar',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            PopupMenuItem(
                              child: Text(
                                'Excluir',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.837,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 20, bottom: 5),
                          child: const Text(
                            'Nota',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 20, bottom: 5),
                          child: const Text(
                            'Preço',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.837,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '4',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow[600],
                          )
                        ],
                      ),
                      const Text(
                        '6',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
