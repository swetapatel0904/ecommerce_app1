import 'package:flutter/material.dart';
import 'package:ecommerce_app1/screen/product/product_screen.dart';
import 'package:ecommerce_app1/screen/home/home_screen.dart';
import 'package:ecommerce_app1/screen/cart/cart_screen.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context)=>HomeScreen(),
        "product":(context)=>ProductScreen(),
        "cart":(context)=>CartScreen(),
      },
    )
  );
}