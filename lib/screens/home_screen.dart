import 'package:flutter/material.dart';
import 'package:task_management/screens/all_tasks_screen.dart';
import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/widgets/button_widget.dart';
import 'package:get/get.dart';

import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/welcome.jpg"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Hello",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                    fontSize: 60),
                children: [
                  TextSpan(
                    text: "\nstart you beautiful day",
                    style: TextStyle(
                        color: AppColors.smallTextColor, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight / 2.5,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AddTaskScreen(),
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 500));
              },
              child: ButtonWidget(
                  backgroundColor: AppColors.mainColor,
                  text: "Add Task",
                  textColor: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AllTasksScreen(),
                    transition: Transition.fade,
                    duration: const Duration(seconds: 1));
              },
              child: ButtonWidget(
                  backgroundColor: Colors.white,
                  text: "View All",
                  textColor: AppColors.smallTextColor),
            )
          ],
        ),
      ),
    );
  }
}
