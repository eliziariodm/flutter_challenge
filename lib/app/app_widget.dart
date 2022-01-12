import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/controllers/products_controller.dart';
import 'package:flutter_challenge/app/views/home_view.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsController>(
          create: (context) => ProductsController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeView(),
      ),
    );
  }
}
