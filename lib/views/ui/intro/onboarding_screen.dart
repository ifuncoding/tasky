import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/views/styles/palette.dart';
import 'package:tasky/views/widgets/button_primary.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              child: SvgPicture.asset('assets/images/Group 140.svg'),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Column(
                children: [
                  ButtonPrimary(
                    text: 'Let’s Go',
                    backgroundColor: Palette.primary,
                  ),
                  SizedBox(height: 10.0),
                  ButtonPrimary(
                    text: 'Not Now',
                    textColor: Palette.text_primary.withOpacity(0.5),
                  ),
                ],
              ),
            )
          ],
        ),
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
