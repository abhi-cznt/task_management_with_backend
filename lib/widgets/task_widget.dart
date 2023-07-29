import 'package:flutter/material.dart';
import 'package:task_management/utils/app_colors.dart';

class TaskWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  const TaskWidget({super.key, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
        color: AppColors.textHolder,

        // borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: textColor),
        ),
      ),
    );
  }
}
