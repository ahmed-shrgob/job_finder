import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:job_finder/constants/cons_API.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/model/CV_model.dart';

class CVVM extends ChangeNotifier {
  CVModel cv = CVModel(
      userID: null,
      fullName: null,
      address: null,
      phone: null,
      email: null,
      skills: null,
      certificate: null,
      experience: null);
  void createCV(CVModel cv) async {
    Dio dio = Dio();
    Response res = await dio.post(APIRoute.createCV, data: cv.toJson());
    print(res.statusCode);
  }

  Future<CVModel> getCV() async {
    Dio dio = Dio();
    Response res = await dio.get(APIRoute.getCV(userId));
    print(userId);
    print(res.statusCode);
    print(res.data);
    print(CVModel.fromJson(res.data["cvs"][0]));
    cv = CVModel.fromJson(res.data["cvs"][0]);
    print(cv);
    return cv;
  }

  void editCV(CVModel cv, cvid) async {
    await Dio().put(APIRoute.editCV(cvid), data: cv.toJson());
  }

  deleteFromList(int index, List list) {
    list.removeAt(index);
    notifyListeners();
  }

  void update(CVModel edetCV) {
    edetCV = cv;
    notifyListeners();
  }
}
