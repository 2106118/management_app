import 'package:flutter/material.dart';
import 'package:management_app/features/product/product_form_screen.dart';
import 'package:management_app/features/product/product_home_screen.dart';
import 'package:management_app/features/sale/sale_form_screen.dart';
import 'package:management_app/features/sale/sale_home_screen.dart';
import 'package:management_app/features/stock/stock_form_screen.dart';
import 'package:management_app/features/stock/stock_home_screen.dart';
import 'package:management_app/features/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/product': (context) => productPages(),
        '/add-product': (context) => ProductFormPage(),
        '/stock': (context) => stockPages(),
        '/add-stock': (context) => StockFormPage(),
        '/reseler': (context) => reselerPages(),
        '/add-reseler': (context) => ReselerFormPage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      home: const WelcomePage(),
    );
  }
}
