import 'package:get/get.dart';
import 'package:task_management/screens/add_task_screen.dart';
import 'package:task_management/screens/all_tasks_screen.dart';
import 'package:task_management/screens/edit_task_screen.dart';
import 'package:task_management/screens/home_screen.dart';
import 'package:task_management/screens/view_task_screen.dart';

class RoutesClass {
// routes name
  static const String _home = "/";
  static const String _allTasks = "/allTasks";
  static const String _addTasks = "/addTasks";
  static const String _editTask = "/editTask";
  static const String _viewTask = "/viewTask";
  static  int? id;
  //routes name getters
  static String getHomeRoute() => _home;
  static String getAllTaskScreenRoute() => _allTasks;
  static String getAddTasksScreen() => _addTasks;
  static String getEditTaskScreen(int taskId){
    id = taskId;
    return _editTask;
  }
  static String getViewTaskScreen(int taskId) {
    id = taskId;
    return _viewTask;
  }

  //pages route list
  static List<GetPage> routes = [
    GetPage(name: _home, page: () => const HomeScreen(),transition: Transition.zoom,transitionDuration: const Duration(milliseconds: 600)),//home page
    GetPage(
        name: _allTasks,
        page: () => const AllTasksScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),//All task screen
    GetPage(
        name: _addTasks,
        page: () => const AddTaskScreen(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 500)),//Add task screen
    GetPage(name: _editTask, page: ()=>EditTaskScreen(id: id!)),
    GetPage(name: _viewTask, page: ()=>ViewTaskScreen(id: id!)),

  ];
}
