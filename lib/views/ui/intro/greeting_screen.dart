import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky/views/styles/palette.dart';
import 'package:tasky/views/ui/intro/onboarding_screen.dart';
import 'package:tasky/views/widgets/button_primary.dart';
import 'package:tasky/views/widgets/custom_text.dart';

class GreetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(25.0),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          'Welcome to ',
                          fontFamily: m_font_nunito,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          'Tasky.',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                          color: Palette.primary,
                        ),
                      ],
                    ),
                    CustomText(
                      'An application that helps to help organize your activities',
                      fontFamily: m_font_nunito,
                      fontSize: 16.0,
                      color: Color(0xff252729).withOpacity(0.6),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  children: [
                    ButtonPrimary(
                      text: 'Let’s Go',
                      backgroundColor: Palette.primary,
                      onTap: () {
                        Get.to(OnboardingScreen());
                      },
                    ),
                    SizedBox(height: 10.0),
                    ButtonPrimary(
                      text: 'Not Now',
                      textColor: Palette.text_primary.withOpacity(0.5),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
