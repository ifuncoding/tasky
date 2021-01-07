import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/views/styles/palette.dart';
import 'package:tasky/views/widgets/custom_text.dart';

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
