import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_management/utils/app_constants.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData(String uri) async {
    if (kDebugMode) {
      print(AppConstants.BASE_URL + uri);
    }
    Response response = await get(AppConstants.BASE_URL + uri,
        headers: {'Content-Type': 'application/json; charset = UTF-8'});
    return response;
  }

  Future<Response> postData(String uri, dynamic body) async {
    Response response = await post(AppConstants.BASE_URL + uri, body,
        headers: {'Content-Type': 'application/json; charset = UTF-8'});
    return response;
  }

  Future<Response> updateData(String uri, dynamic body) async {
    Response response = await put(AppConstants.BASE_URL + uri, body,
        headers: {'Content-Type': 'application/json; charset = UTF-8'});
    return response;
  }
  
  Future<Response> deleteData(String uri) async{
    Response response = await delete(AppConstants.BASE_URL+uri,
    headers: {'Content-Type':'application/json; charset = UTF -8'});
    return response;

  }

}
