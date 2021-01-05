import 'package:flutter/material.dart';
import 'package:tasky/app/drawer_page.dart';
import 'package:tasky/app/zoom_scaffold.dart';
import 'package:provider/provider.dart';

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
