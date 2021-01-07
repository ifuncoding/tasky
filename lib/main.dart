import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky/views/styles/palette.dart';
import 'package:tasky/views/ui/route.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Palette.scaffold,
        scaffoldBackgroundColor: Palette.scaffold,
        fontFamily: 'Poppins',
        textTheme: TextTheme(bodyText1: TextStyle(color: Palette.text_primary)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Palette.scaffold,
          fontFamily: 'Poppins',
          textTheme: TextTheme(bodyText1: TextStyle(color: Palette.text_primary)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RouteApp(),
      ),
    );
  }
}
