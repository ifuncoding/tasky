import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tasky/app/zoom_scaffold.dart';
import 'package:tasky/views/styles/palette.dart';
import 'package:tasky/views/ui/intro/greeting_screen.dart';
import 'package:tasky/views/widgets/custom_text.dart';

import 'circular_image.dart';

class DrawerScreen extends StatelessWidget {
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  final List<MenuItem> options = [
    MenuItem(SvgPicture.asset('assets/icons/user.svg', color: Colors.white),
        'Manage Account', () {}),
    MenuItem(SvgPicture.asset('assets/icons/search.svg', color: Colors.white),
        'Search Tasks', () {}),
    MenuItem(SvgPicture.asset('assets/icons/activity.svg', color: Colors.white),
        'Activity', () {}),
    MenuItem(
        SvgPicture.asset('assets/icons/settings.svg'), 'App Settings', () {}),
    MenuItem(SvgPicture.asset('assets/icons/log-in.svg'), 'Logout', () {
      Get.offAll(GreetingScreen());
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 62,
            left: 12,
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2.9),
        color: Palette.bg_drawer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Provider.of<MenuController>(context, listen: true).toggle();
              },
              child: SvgPicture.asset('assets/icons/back_drawer.svg'),
            ),
            SizedBox(height: 61),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    width: 66,
                    height: 66,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'Jessie Yaegar',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      CustomText(
                        'Indonesia',
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 61),
            Column(
              children: options.map((item) {
                return ListTile(
                  leading: item.icon,
                  title: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  onTap: item.onTap,
                );
              }).toList(),
            ),
            Spacer(),
            ListTile(
              onTap: () {},
              title: Text('Analytics',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            ListTile(),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  SvgPicture icon;
  Function onTap;

  MenuItem(this.icon, this.title, this.onTap);
}
