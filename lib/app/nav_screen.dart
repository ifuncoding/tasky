import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/views/styles/palette.dart';
import 'package:tasky/views/ui/activity/activity_screen.dart';
import 'package:tasky/views/ui/home/home_screen.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ActivityScreen(),
    Container(),
    Container(),
  ];

  final List<String> _tabs = [
    'assets/icons/home.svg',
    'assets/icons/activity.svg',
    'assets/icons/user.svg',
    'assets/icons/plus.svg',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 45.0),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          items: _tabs
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    icon: key != _tabs.length - 1
                        ? SvgPicture.asset(
                            value,
                            color: key != _selectedIndex
                                ? Colors.white.withOpacity(0.5)
                                : Colors.transparent,
                            colorBlendMode: BlendMode.overlay,
                          )
                        : Container(
                            width: 46.0,
                            height: 46.0,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Palette.primary,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Palette.primary.withOpacity(0.4),
                                    offset: Offset(0, 5),
                                    spreadRadius: -3.0,
                                    blurRadius: 1.0,
                                  ),
                                ]),
                            child: SvgPicture.asset(value),
                          ),
                    label: '',
                  ),
                ),
              )
              .values
              .toList(),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.black45,
          unselectedFontSize: 10.0,
          selectedFontSize: 10.0,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
