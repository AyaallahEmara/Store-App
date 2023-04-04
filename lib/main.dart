import 'package:flutter/material.dart';
import 'package:store/screens/electronics-screen.dart';
import 'package:store/screens/home-screen.dart';
import 'package:store/screens/jeweliry-screen.dart';
import 'package:store/screens/mens-screen.dart';
import 'package:store/screens/update-product-Screen.dart';
import 'package:store/screens/women-screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        HomeScreen.id : (context) => HomeScreen(),
        UpdateProductScreen.id : (context) => UpdateProductScreen(),
        ElectronicsScreen.id : (context) => ElectronicsScreen(),
        JeweliryScreen.id : (context) => JeweliryScreen(),
        MenScreen.id : (context) => MenScreen(),
        WomenScreen.id : (context) => WomenScreen(),
      },
     initialRoute: HomeScreen.id,
    );
  }
}
