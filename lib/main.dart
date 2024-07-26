import 'package:flutter/material.dart';
import 'package:weather_app/Screens/homePage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => HomePage(),
    },
  ));
}
