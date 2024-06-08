import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_finder/constants/cons_API.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/model/user_model.dart';

class AuthVM {
  // User user = User();
  Dio dio = Dio();
  Future<bool> login(String email, String password) async {
    try {
      Response<Map<String, dynamic>> response = await dio.post(
        APIRoute.login,
        data: {"email": email, "password": password},
      );
      print(response.data);

      if (response.statusCode == 200) {
        saveUserData(response.data!["id"], response.data!['type']);
        // userId = response.data!["id"];
        print(userId);
        print(response.data);
        print(response.statusCode);
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e);
        print(e.response!.statusCode);
        print(e.response!.headers);
        print(e.response!.requestOptions.data);
        return false;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        return false;
      }
    }
  }

  Future<bool> signup(
    String email,
    String password,
    String name,
  ) async {
    Response<Map<String, dynamic>> response = await dio.post(
      APIRoute.singup,
      data: {
        "email": email,
        "password": password,
        "name": name,
        "type": "user"
      },
    );

    if (response.statusCode == 201) {
      saveUserData(response.data!["id"], response.data!['type']);
      userId = response.data!["id"];
      print(response.data);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> companySignup(User user) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.post(APIRoute.companySignup, data: user.toJson('company'));
      saveUserData(response.data!["id"], response.data!["type"]);
      userId = response.data!["id"];
      print(response.data);
      return true;
    } on DioException catch (e) {
      print(e);
      print(e.response!.statusCode);
      return false;
    }
  }

  saveUserData(String id, String type) {
    final box = GetStorage();
    box.write('userId', id);
    box.write('userType', type);
    userId = id;
    userType = type;
  }
}
