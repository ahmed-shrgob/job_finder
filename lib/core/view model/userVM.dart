import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:job_finder/constants/cons_API.dart';
import 'package:job_finder/core/model/user_model.dart';

class UserVM extends ChangeNotifier {
  late User user;
  late List<User> topFollowedCompanies ; 
  
  Dio dio = Dio();

  Future<User> getUserData(String userID) async {
    try {
      print("Fetching data for user ID: $userID");
      Response response = await dio.get(APIRoute.getUserData(userID));
      print("Response data: ${response.data}");
      user = User.fromJson(response.data!);
      return user;
    } on DioException catch (e) {
      print("Error fetching user data: $e");
      rethrow;
    }
  }

  Future<List<User>> getTopFollowedCompanies() async {
    try {
      Response response = await dio.get(APIRoute.getTopFollowedCompanies);
      topFollowedCompanies = (response.data as List)
          .map((value) => User.fromJson(value as Map<String, dynamic>))
          .toList();
      return topFollowedCompanies;
    } on DioException catch (e) {
      print("Error top followed : $e");
      return topFollowedCompanies;
    }
  }
}
