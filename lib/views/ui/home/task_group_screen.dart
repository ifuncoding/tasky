import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky/views/widgets/task_vertical_item.dart';

class TaskGroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            alignment: Alignment.centerLeft,
            child: Image.asset('assets/icons/back.png'),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return TaskVerticalItem();
        },
      ),
    );
  }
}
