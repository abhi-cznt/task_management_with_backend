import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/utils/app_colors.dart';
class Message{
    static void taskErrorOrWarning(String taskName, taskErrorOrWarning){
      Get.snackbar(taskName, taskErrorOrWarning,
      backgroundColor: AppColors.mainColor,
      titleText: Text(taskName, style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),),
        messageText: Text(taskErrorOrWarning, style: const TextStyle(
          color: Colors.amber,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ))
      );
    }

}