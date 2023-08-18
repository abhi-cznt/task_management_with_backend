import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/controllers/data_controller.dart';
import 'package:task_management/screens/all_tasks_screen.dart';
import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/widgets/button_widget.dart';
import 'package:task_management/widgets/error_warning_ms.dart';
import 'package:task_management/widgets/textfield_widget.dart';

class EditTaskScreen extends StatelessWidget {
  final int id;
  const EditTaskScreen({super.key, required this.id});
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

    bool validation() {
      if (taskNameController.text.trim().isEmpty) {
        // Get.snackbar("Task name", "Task name can't be empty");
        Message.taskErrorOrWarning("Task name", "Task name is empty");
        return false;
      } else if (taskDetailsController.text.trim().isEmpty) {
        Message.taskErrorOrWarning("Task detail", "Task detail is empty!");
        return false;
      }
      return true;
    }

    return Scaffold(
      body: GetBuilder<DataController>(builder: (controller) {
        taskNameController.text =
            controller.singleData['task_name'] ?? 'Task name do not found';
        taskDetailsController.text =
            controller.singleData['task_detail'] ?? 'Task detail not found';
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
                  hintText: "Task name",
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    textController: taskDetailsController,
                    hintText: "Task details",
                    borderRadius: 15,
                    maxLines: 3),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      if (validation()) {
                        Get.find<DataController>().updateData(
                            taskNameController.text.trim(),
                            taskDetailsController.text.trim(),
                            int.parse(controller.singleData['id']));
                        Get.to(() => const AllTasksScreen(),
                            transition: Transition.circularReveal);
                        print("task added successful");
                      }
                      return;
                    },
                    child: ButtonWidget(
                        backgroundColor: AppColors.mainColor,
                        text: "Edit",
                        textColor: Colors.white))
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