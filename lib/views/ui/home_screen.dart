import 'package:flutter/material.dart';
import 'package:tasky/views/widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('hello world'),
            CustomText(
              text: 'Welcome',
              fontFamily: 'Nunito',
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
