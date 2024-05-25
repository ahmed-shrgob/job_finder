import 'package:dio/dio.dart';
import 'package:job_finder/constants/cons_API.dart';
import 'package:job_finder/core/model/request_model.dart';

class RequstVM {
  final dio = Dio();
  late List<Request> requestList;
  late String requestMessege;
  Future<bool> handleCVRequest(
      {required String userID, required String jobID}) async {
    try {
      Response response = await dio.post(APIRoute.handleCVRequest, data: {
        "userId": userID,
        "jobId": jobID,
      });
      print(response.data);
      requestMessege = response.data["requestMessege"] ?? "تم تقديم الطلب";
      return true;
    } on DioException catch (e) {
      print(e);
      requestMessege = "حدث خطأ..اعد المحاولة لاحقاً";
      return false;
    }
  }

  Future<List> getJobsByCompanyId(String id) async {
    try {
      Response<List> response =
          await dio.get(APIRoute.getJobsByCompanyId(id));
          // print(response.data);
      requestList = response.data!.map((e) => Request.fromJson(e)).toList();
      print(requestList);
      return requestList;
    } on DioException catch (e) {
      print(e);
      print(e.response);
      return requestList;
    }
  }
}
