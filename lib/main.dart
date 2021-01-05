import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/app/zoom_scaffold.dart';
import 'package:tasky/views/styles/palette.dart';

import 'app/drawer_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Zoom Menu',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Palette.primary,
        scaffoldBackgroundColor: Palette.scaffold,
        textTheme: TextTheme(bodyText1: TextStyle(color: Palette.text_primary)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: ZoomScaffold(
        menuScreen: DrawerScreen(),
        contentScreen: Layout(
          contentBuilder: (cc) => Container(
            color: Colors.grey[200],
            child: Container(
              color: Colors.grey[200],
            ),
          ),
        ),
      ),
    );
  }
}
