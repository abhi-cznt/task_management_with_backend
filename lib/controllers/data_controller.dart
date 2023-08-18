import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_management/services/service.dart';
import 'package:task_management/utils/app_constants.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Map<String, dynamic> _singleData = {};
  Map<String, dynamic> get singleData => _singleData;
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstants.GET_TASKS);
    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got the data");
    } else {
      print("we didn't got any data");
    }

    _isLoading = false;
    update();
  }

  Future<dynamic> getSingleTask(String id) async {
    _isLoading = true;
    Response response =
        await service.getData('${AppConstants.GET_TASK}' '/$id');

    if (response.statusCode == 200) {
      if (kDebugMode) {
        _singleData = jsonDecode(response.body);
        print("we got the single data:$_singleData");
      }
    } else {
      print("we didn't got the single data");
    }
    _isLoading = false;
    update();
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(AppConstants.POST_TASK,
        {'task_name': task, 'task_detail': taskDetail});
    if (response.statusCode == 200) {
      print("Data post successful");
    } else {
      print("Data post failed");
    }
    _isLoading = false;
    update();
  }

  Future<void> updateData(String task, String taskDetail, int id)async {
    _isLoading = true;
    Response response = await service.updateData('${AppConstants.UPDATE_TASK}''$id', {'task_name': task, 'task_detail': taskDetail});
    if(response.statusCode == 200){

      print("Data update successful");
    }else{
      print("Data update failed");
    }
    _isLoading = false;
    update();
  }
  Future<void> deleteData(int id) async{
    _isLoading = true;
    update();
    // Response response = await service.deleteData("${AppConstants.DELETE_TASK}"'$id');
    Response response = await service.deleteData(AppConstants.DELETE_TASK+id.toString());
    if(response.statusCode == 200){
      print("Data deleted");
    }else{
      print("Data delete failed");
    }
   await Future.delayed(const Duration(seconds: 1),(){
      _isLoading = false;
      update();
    });
  }
}
