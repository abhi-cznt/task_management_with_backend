import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/utils/routes.dart';

import 'controllers/data_controller.dart';

void main() {
  Get.lazyPut(()=>DataController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute:RoutesClass.getHomeRoute(),
      getPages: RoutesClass.routes,
      // home: const HomeScreen(),
    );
  }
}
