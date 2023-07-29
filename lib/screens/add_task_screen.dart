import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/widgets/button_widget.dart';
import 'package:task_management/widgets/textfield_widget.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    TextEditingController taskNameController = TextEditingController();
    TextEditingController taskDetailsController = TextEditingController();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/addtask1.jpg"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              const SizedBox(
                height: 60,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
                color: AppColors.secondaryColor,
              )
            ]), //header
            Column(children: [
              TextFieldWidget(
                  textController: taskNameController,
                  hintText: "Task name",),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  textController: taskDetailsController,
                  hintText: "Task details",
                  borderRadius: 15,
                  maxLines: 3),
              const SizedBox(height: 30,),
              ButtonWidget(backgroundColor: AppColors.mainColor, text: "Add", textColor: Colors.white)
            ]), //text-fields, button
            SizedBox(
              height: screenHeight / 6,
            )
          ],
        ),
      ),
    );
  }
}
