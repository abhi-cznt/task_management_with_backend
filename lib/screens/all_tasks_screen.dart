import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/widgets/button_widget.dart';
import 'package:task_management/widgets/task_widget.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    List myData = ['Try harder', 'Try smarter'];

    final leftEditIcon = Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
    final rightDeleteIcon = Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60.0, left: 20.0),
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: screenHeight / 3.2,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/header1.jpg"),
            )),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
              ),
            ),
          ), //header
          Container(
            margin: EdgeInsets.only(top: screenHeight / 100),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ), //home
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.5)),
                  child: const Icon(Icons.add, color: Colors.white, size: 20.0),
                ), //add
                Expanded(child: Container()),
                Icon(
                  Icons.calendar_month,
                  color: AppColors.secondaryColor,
                ), //calender
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "2",
                  style:
                      TextStyle(color: AppColors.secondaryColor, fontSize: 20),
                ), //no. of tasks
              ],
            ),
          ), //option row
          Flexible(
            child: ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: rightDeleteIcon,
                    key: ObjectKey(index),
                    onDismissed: (DismissDirection direction) {},
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF2e3253).withOpacity(0.4),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ButtonWidget(
                                          backgroundColor: AppColors.mainColor,
                                          text: "View",
                                          textColor: Colors.white),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ButtonWidget(
                                          backgroundColor: AppColors.mainColor,
                                          text: "Edit",
                                          textColor: Colors.white),
                                    ]),
                              ),
                            );
                          },
                          showDragHandle: false,
                          backgroundColor: Colors.transparent,
                          barrierColor: Colors.transparent,
                        );
                        return false;
                      } else {
                        return Future.delayed(const Duration(seconds: 1), () {
                          return direction == DismissDirection.endToStart;
                          // return true;
                        });
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: TaskWidget(
                          text: myData[index], textColor: Colors.blueGrey),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
