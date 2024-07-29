import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/detailPage.dart';
import 'package:weather_app/Screens/homePage.dart';
import 'package:weather_app/Screens/saved_city.dart';
import 'package:weather_app/provider/SavedCity_Provider.dart';
import 'package:weather_app/provider/themeProvider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SavedLocationsProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: (Provider.of<ThemeProvider>(context).istap)
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'detailPage': (context) => DetailPage(),
        'SavedCity': (context) => SavedCity(),
      },
    );
  }
}
