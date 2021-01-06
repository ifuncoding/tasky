import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tasky/app/zoom_scaffold.dart';
import 'package:tasky/views/styles/palette.dart';
import 'package:tasky/views/ui/auth/auth_screen.dart';
import 'package:tasky/views/ui/route.dart';
import 'package:tasky/views/ui/intro/greeting_screen.dart';

import 'app/drawer_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MaterialApp(
        title: 'Zoom Menu',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Palette.scaffold,
          textTheme:
              TextTheme(bodyText1: TextStyle(color: Palette.text_primary)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RouteApp(),
      ),
    );
  }
}
