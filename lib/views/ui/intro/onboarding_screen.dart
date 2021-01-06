import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasky/views/styles/palette.dart';
import 'package:tasky/views/ui/auth/auth_screen.dart';
import 'package:tasky/views/ui/route.dart';
import 'package:tasky/views/widgets/button_primary.dart';
import 'package:tasky/views/widgets/custom_text.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  List<OnboardingContent> splashData = [
    OnboardingContent(
        title: 'Manage your activity',
        description:
            'Manage the progress of the tasks completion track the time and analyze tha stats',
        image: SvgPicture.asset(
          'assets/images/Group 140.svg',
          fit: BoxFit.cover,
        ),
        buttonText: 'Next'),
    OnboardingContent(
        title: 'Save the time',
        description:
            'Manage the progress of the tasks completion track the time and analyze tha stats',
        image: SvgPicture.asset(
          'assets/images/Group 141.svg',
          fit: BoxFit.cover,
        ),
        buttonText: 'Get Started'),
  ];

  void onTap(int index) {
    if (currentPage == splashData.length - 1) {
      Get.offAll(AuthScreen());
    } else {
      pageController.animateToPage(
        index + 1,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      );
      setState(() {
        currentPage = index + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        controller: pageController,
        itemCount: splashData.length,
        itemBuilder: (context, index) => OnboardingPage(
          size: size,
          data: splashData[index],
          onTap: () {
            onTap(index);
          },
        ),
      ),
      bottomSheet: SafeArea(
        child: Container(
          color: Colors.white,
          height: 100,
          child: Column(
            children: [
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  splashData.length,
                  (index) => buildDot(index: index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 12),
      height: 9,
      width: currentPage == index ? 27 : 9,
      decoration: BoxDecoration(
        color: currentPage == index ? Palette.primary : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(9),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingContent data;
  final Function onTap;

  const OnboardingPage({
    Key key,
    @required this.size,
    @required this.data,
    this.onTap,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: size.height * 0.56,
              alignment: Alignment.bottomCenter,
              child: data.image),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 22.0),
              child: Column(
                children: [
                  CustomText(
                    data.title,
                    fontSize: 22.0,
                    fontFamily: m_font_nunito,
                    fontWeight: FontWeight.w700,
                    color: Palette.text_primary.withOpacity(0.8),
                  ),
                  SizedBox(height: 15.0),
                  CustomText(
                    data.description,
                    color: Palette.text_primary.withOpacity(0.25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 64.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.0),
                    child: ButtonPrimary(
                      text: data.buttonText,
                      backgroundColor: Palette.primary,
                      onTap: onTap,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingContent {
  final String title;
  final String description;
  final SvgPicture image;
  final String buttonText;

  const OnboardingContent({
    this.title,
    this.description,
    this.image,
    this.buttonText,
  });
}
