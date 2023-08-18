import 'package:get/get.dart';
import 'package:task_management/screens/add_task_screen.dart';
import 'package:task_management/screens/all_tasks_screen.dart';
import 'package:task_management/screens/home_screen.dart';

class RoutesClass {
// routes name
  static const String _home = "/";
  static const String _allTasks = "/allTasks";
  static const String _addTasks = "/addTasks";
  //routes name getters
  static String getHomeRoute() => _home;
  static String getAllTaskScreenRoute() => _allTasks;
  static String getAddTasksScreen() => _addTasks;

  //pages route list
  static List<GetPage> routes = [
    GetPage(name: _home, page: () => const HomeScreen()),
    GetPage(
        name: _allTasks,
        page: () => const AllTasksScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: _addTasks,
        page: () => const AddTaskScreen(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 500))
  ];
}
