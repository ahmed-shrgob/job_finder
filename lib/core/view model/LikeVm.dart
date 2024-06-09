import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:job_finder/constants/cons_API.dart';
import 'package:job_finder/core/model/likeModel.dart';

class LikeVm extends ChangeNotifier {
  LikeModel likeModel = LikeModel();
  List Likelist = [];
  // List<LikeModel> get likeList {
  //   return [..._Likelist];
  // }

  Dio dio = Dio();
  // Future<List> getAllLikeblog(blogid) async {
  //   try {
  //     Response response = await dio.get(AppRoute.getLikeblog(blogid));
  //     List res = response.data;
  //     Likelist =
  //         response.data.map((value) => LikeModel.formJosn(value)).toList();
  //   } catch (e) {
  //     print(e);
  //   }
  //   // print(Likelist.length);
  //   return Likelist;
  // }

  Future<bool> AddLike(String IDUser,String IDblog) async {
    try {
      Response response =
          await dio.post(APIRoute.like, data: {
      "userId": IDUser,
      "postId": IDblog,
    });
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  Update() {
    notifyListeners();
  }
}
