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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
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
                  Row(
                    children: [
                      MyTaskItem(),
                      MyTaskItem(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyTaskItem extends StatelessWidget {
  const MyTaskItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152.0,
      height: 200.0,
      padding:
          EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg1.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            spreadRadius: -5.0,
            blurRadius: 10.0,
            color: Palette.bg_item_1.withOpacity(0.5),
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
            child:
                SvgPicture.asset('assets/icons/smartphone.svg'),
          ),
          CustomText(
            '2 Task',
            color: Colors.white.withOpacity(0.5),
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 4.0,),
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
