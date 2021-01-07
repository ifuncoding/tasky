import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasky/views/styles/palette.dart';
import 'package:tasky/views/ui/route.dart';
import 'package:tasky/views/widgets/button_primary.dart';
import 'package:tasky/views/widgets/custom_text.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final List<String> _tabs = <String>[
    'Log In',
    'Sign Up',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              headerBox(),
              TabBar(
                indicatorColor: Palette.primary,
                indicatorWeight: 3.0,
                labelColor: Palette.text_primary,
                unselectedLabelColor: Palette.text_primary.withOpacity(0.5),
                labelPadding: EdgeInsets.symmetric(vertical: 16.0),
                tabs: _tabs
                    .asMap()
                    .map(
                      (key, value) => MapEntry(
                        key,
                        Text(
                          value,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: m_font_nunito,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    LoginPage(),
                    SignUpPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container headerBox() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 45.0),
      child: CustomText(
        'Tasky .',
        color: Palette.primary,
        fontSize: 26.0,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      color: Palette.bg_gray_200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 44.0),
          CustomText(
            'Username or E-mail',
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              style: TextStyle(
                fontFamily: m_font_nunito,
                fontSize: 14.0,
                color: Palette.text_primary.withOpacity(0.4),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your username or E-mail',
                hintStyle: TextStyle(
                  fontFamily: m_font_nunito,
                  fontSize: 14.0,
                  color: Palette.text_primary.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          CustomText(
            'Password',
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(
                fontFamily: m_font_nunito,
                fontSize: 14.0,
                color: Palette.text_primary.withOpacity(0.4),
              ),
              decoration: InputDecoration(
                suffix: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset('assets/icons/eye-off.svg'),
                ),
                border: InputBorder.none,
                hintText: 'Enter your password',
                hintStyle: TextStyle(
                  fontFamily: m_font_nunito,
                  fontSize: 14.0,
                  color: Palette.text_primary.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(height: 22.0),
          CustomText(
            'Forgot Password?',
            fontFamily: m_font_nunito,
            color: Palette.text_primary.withOpacity(0.8),
            textAlign: TextAlign.end,
          ),
          SizedBox(height: 22.0),
          ButtonPrimary(
            text: 'Login',
            onTap: () {
              Get.offAll(RouteApp());
            },
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 55.0),
            child: Column(
              children: [
                Row(children: <Widget>[
                  Expanded(child: Divider()),
                  SizedBox(width: 10),
                  CustomText(
                    "Or login with",
                    fontSize: 14.0,
                    fontFamily: m_font_nunito,
                    color: Palette.text_primary.withOpacity(0.3),
                  ),
                  SizedBox(width: 10),
                  Expanded(child: Divider()),
                ]),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        'assets/images/image 1.png',
                      ),
                    ),
                    SvgPicture.asset('assets/images/Group 95.svg'),
                    SvgPicture.asset('assets/images/Group 96.svg'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      color: Palette.bg_gray_200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 44.0),
          CustomText(
            'Username or E-mail',
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              style: TextStyle(
                fontFamily: m_font_nunito,
                fontSize: 14.0,
                color: Palette.text_primary.withOpacity(0.4),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your username or E-mail',
                hintStyle: TextStyle(
                  fontFamily: m_font_nunito,
                  fontSize: 14.0,
                  color: Palette.text_primary.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          CustomText(
            'E-mail',
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              style: TextStyle(
                fontFamily: m_font_nunito,
                fontSize: 14.0,
                color: Palette.text_primary.withOpacity(0.4),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your E-mail',
                hintStyle: TextStyle(
                  fontFamily: m_font_nunito,
                  fontSize: 14.0,
                  color: Palette.text_primary.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          CustomText(
            'Password',
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(
                fontFamily: m_font_nunito,
                fontSize: 14.0,
                color: Palette.text_primary.withOpacity(0.4),
              ),
              decoration: InputDecoration(
                suffix: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset('assets/icons/eye-off.svg'),
                ),
                border: InputBorder.none,
                hintText: 'Enter your password',
                hintStyle: TextStyle(
                  fontFamily: m_font_nunito,
                  fontSize: 14.0,
                  color: Palette.text_primary.withOpacity(0.4),
                ),
              ),
            ),
          ),
          SizedBox(height: 42.0),
          ButtonPrimary(text: 'Login'),
        ],
      ),
    );
  }
}
