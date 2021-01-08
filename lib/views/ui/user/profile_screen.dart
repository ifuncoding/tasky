import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/views/styles/palette.dart';
import 'package:tasky/views/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                    child: Row(
                      children: [
                        Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    'Jessie Yaegar',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(width: 25),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    child: SvgPicture.asset(
                                        'assets/icons/chevron-up.svg'),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    child: SvgPicture.asset(
                                      'assets/icons/crown 1.svg',
                                      color: Palette.primary,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  CustomText(
                                    'VIP Usser',
                                    color: Palette.primary,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 35, horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'General',
                          fontWeight: FontWeight.w500,
                          color: Palette.text_primary.withOpacity(0.5),
                        ),
                        SizedBox(height: 30),
                        ProfileTileItem(
                          title: 'Manage Account',
                          tileColor: Color(0xffA2F0E2),
                        ),
                        SizedBox(height: 15),
                        ProfileTileItem(
                          title: 'Notification',
                          tileColor: Color(0xffF1EEAD),
                          icon: 'assets/icons/ring.svg',
                        ),
                        SizedBox(height: 15),
                        ProfileTileItem(
                          title: 'Become An VIP User',
                          tileColor: Color(0xffCBADF1),
                        ),
                        SizedBox(height: 15),
                        ProfileTileItem(
                          title: 'Logout',
                          tileColor: Color(0xffF4B6B6),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTileItem extends StatelessWidget {
  final String title;
  final Color tileColor;
  final String icon;
  final Widget action;

  const ProfileTileItem({
    Key key,
    @required this.title,
    this.tileColor = Palette.primary,
    this.icon = 'assets/icons/user.svg',
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: tileColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(icon),
          ),
          SizedBox(width: 25),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          action != null
              ? action
              : Container(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset('assets/icons/chevron-up.svg'),
                ),
        ],
      ),
    );
  }
}
