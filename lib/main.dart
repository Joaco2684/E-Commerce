import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/pages/product_details.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home'  : ( BuildContext context ) => HomePage(),
        'product_details' : (BuildContext context) => ProductDetails(),
      }
    );
  }
}