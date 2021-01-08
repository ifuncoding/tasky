import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tasky/app/zoom_scaffold.dart';
import 'package:tasky/views/styles/palette.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Provider.of<MenuController>(context, listen: true).toggle();
              },
              child: SvgPicture.asset(
                'assets/icons/menu.svg',
              ),
            ),
            Spacer(),
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: Palette.bg_gray_100,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/icons/filter.svg'),
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
