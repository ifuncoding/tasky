import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tasky/app/zoom_scaffold.dart';
import 'package:tasky/views/styles/palette.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Provider.of<MenuController>(context, listen: true).toggle();
                  },
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Color(0xffFBFBFB),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 3.0,
                        child: Container(
                          width: 7.0,
                          height: 7.0,
                          decoration: BoxDecoration(
                            color: Palette.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/ring.svg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
