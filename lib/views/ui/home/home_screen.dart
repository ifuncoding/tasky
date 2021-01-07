import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tasky/app/zoom_scaffold.dart';
import 'package:tasky/views/styles/palette.dart';
import 'package:tasky/views/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              title: HomeAppBar(),
            ),
            SliverToBoxAdapter(
              child: HomeHeader(),
            ),
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                height: 50,
                decoration: BoxDecoration(
                  color: Palette.bg_gray_100,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Palette.text_primary.withOpacity(0.4),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      margin: EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/icons/Union.svg',
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    border: InputBorder.none,
                    hintText: 'Search Your Task',
                    hintStyle: TextStyle(
                      fontSize: 13.0,
                      color: Palette.text_primary.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TaskGroupLists(),
            ),
            SliverToBoxAdapter(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        tabs: [
                          Container(
                            child: Tab(
                              text: 'In Progress',
                            ),
                            margin: EdgeInsets.only(right: 15.0),
                          ),
                          Tab(
                            text: 'Complete',
                          ),
                        ],
                        unselectedLabelColor:
                            Palette.text_primary.withOpacity(0.5),
                        indicatorColor: Palette.primary,
                        indicatorWeight: 3.0,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Palette.text_primary,
                        indicatorPadding: EdgeInsets.only(right: 20.0),
                        isScrollable: true,
                        labelPadding: EdgeInsets.only(left: 0.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return TaskVerticalItem();
            },
          ),
        ),
      ),
    );
  }
}

class TaskVerticalItem extends StatelessWidget {
  final bool isDone;

  const TaskVerticalItem({
    Key key,
    this.isDone = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      width: double.infinity,
      height: 75.0,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            margin: isDone
                ? EdgeInsets.only(right: 14)
                : EdgeInsets.symmetric(horizontal: 18),
            child: isDone
                ? SvgPicture.asset('assets/icons/arrow-left-circle.svg')
                : Stack(
                    children: [
                      Container(
                        width: 3,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Palette.bg_item_1.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 3,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Palette.bg_item_1,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  'Create New Features',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  'Mobile Apps Design',
                  fontSize: 15,
                  color: Palette.text_primary.withOpacity(0.5),
                ),
              ],
            ),
          ),
          Spacer(),
          SvgPicture.asset('assets/icons/more-horizontal.svg'),
        ],
      ),
    );
  }
}

class TaskGroupLists extends StatelessWidget {
  const TaskGroupLists({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            child: CustomText(
              'My Tasks',
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 14.0),
          Container(
            height: 220.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(right: 25.0, bottom: 20),
              children: [
                SizedBox(width: 15.0),
                MyTaskItem(
                  title: 'Mobile App Design',
                  taskColor: Palette.bg_item_1,
                  taskLength: 2,
                ),
                SizedBox(width: 15.0),
                MyTaskItem(
                  title: 'Meeting With Team',
                  taskBackground: 'assets/images/bg2.png',
                  icon: 'assets/icons/monitor.svg',
                  taskColor: Palette.bg_item_2,
                  taskLength: 1,
                ),
                SizedBox(width: 15.0),
                MyTaskItem(
                  title: 'Meeting With Team',
                  taskBackground: 'assets/images/bg3.png',
                  taskColor: Palette.bg_item_3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyTaskItem extends StatelessWidget {
  final String title;
  final Color taskColor;
  final int taskLength;
  final String icon;
  final String taskBackground;

  const MyTaskItem({
    Key key,
    @required this.title,
    this.taskColor = Palette.primary,
    this.taskLength = 0,
    this.icon = 'assets/icons/smartphone.svg',
    this.taskBackground = 'assets/images/bg1.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152.0,
      height: 200.0,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(taskBackground),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            spreadRadius: -5.0,
            blurRadius: 10.0,
            color: taskColor.withOpacity(0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5.32),
            ),
            width: 30.0,
            height: 30.0,
            padding: EdgeInsets.all(2.0),
            margin: EdgeInsets.symmetric(vertical: 4.0),
            child: SvgPicture.asset(icon),
          ),
          CustomText(
            taskLength.toString() + ' Tasks',
            color: Colors.white.withOpacity(0.5),
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 4.0,
          ),
          CustomText(
            'Mobile App Design',
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText(
                'Hello,',
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                'Jessie',
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Palette.primary,
              ),
            ],
          ),
          CustomText(
            'Complete your taks today',
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Spacer(),
        Container(
          width: 46.0,
          height: 46.0,
          padding: EdgeInsets.all(12.0),
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
        SizedBox(width: 16.0),
        Container(
          width: 46.0,
          height: 46.0,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ],
    );
  }
}
