import 'package:dio/dio.dart';
import 'package:job_finder/constants/cons_API.dart';
import 'package:job_finder/core/model/user_model.dart';

class UserVM {
  late User user;
  Future<User> getUserData(String userID) async {
    Dio dio = Dio();
    print(userID);
    Response response =
        await dio.get(APIRoute.getUserData(userID));
    user = User.fromJson(response.data!);
    return user;
  }

  //  String? userType;
  // Future<String?> checkType() async {
  //   Dio dio = Dio();
  //   try {
  //     Response<Map<String, dynamic>> response =
  //         await dio.get(APIRoute.checkType);
  //         userType=response.data!["type"];
  //     return userType;
  //   } on DioException catch (e) {
  //     print(e);
  //     return 'لم يتم تسجيل الدخول بعد!';
  //   }
  // }
}
