import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/controllers/data_controller.dart';

import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/widgets/textfield_widget.dart';

class ViewTaskScreen extends StatelessWidget {
  final int id;
  const ViewTaskScreen({super.key, required this.id});
  _loadSingleTask() async {
    await Get.find<DataController>().getSingleTask(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    _loadSingleTask();
    var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;
    TextEditingController taskNameController = TextEditingController();
    TextEditingController taskDetailsController = TextEditingController();

    return Scaffold(
      body: GetBuilder<DataController>(builder: (controller) {
        taskNameController.text = controller.singleData['task_name']??'Task name not found';
        taskDetailsController.text = controller.singleData['task_detail']??'Task detail not found';
        return Container(
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
                    readOnly: true,
                    hintText: 'Task name'),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    readOnly: true,
                    textController: taskDetailsController,
                    hintText: "Task detail",
                    borderRadius: 15,
                    maxLines: 3),
              ]), //text-fields, button
              SizedBox(
                height: screenHeight / 6,
              )
            ],
          ),
        );
      }),
    );
  }
}
