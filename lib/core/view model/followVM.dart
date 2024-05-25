import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:job_finder/constants/cons_API.dart';

class FollowVM extends ChangeNotifier {
  final dio = Dio();
  late bool isFollow;
  Future<bool> follow(String userID, String targetUserId) async {
    try {
      Response<Map<String, dynamic>> res = await dio.post(APIRoute.follow,
          data: {
            "userId": userID,
            "targetUserId": targetUserId
          });
      print(res.data);
      isFollow = res.data!["following"];
      return isFollow;
    } on DioException catch (e) {
      print(e);
      return false;
    }
  }
  Future<bool> unFollow(String userID, String targetUserId) async {
    try {
      Response<Map<String, dynamic>> res = await dio.post(APIRoute.unFollow,
          data: {
            "userId": userID,
            "targetUserId": targetUserId
          });
      print(res.data);
      isFollow = false;
      return isFollow;
    } on DioException catch (e) {
      print(e);
      return false;
    }
  }
  Future<bool> checkIfUserFollows(String userID, String targetUserId) async {
    try {
      Response<Map<String, dynamic>> res = await dio.post(APIRoute.checkIfUserFollows,
          data: {
            "followerUserID": userID,
            "followedUserID": targetUserId
          });
      print(res.data);
      isFollow = res.data!["isFollowing"];
      return isFollow;
    } on DioException catch (e) {
      print(e);
      return false;
    }
  }
  update(){
    notifyListeners();
  }
}
