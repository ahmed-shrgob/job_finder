import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:job_finder/constants/cons_API.dart';
import 'package:job_finder/core/model/job_model.dart';

class JobVM extends ChangeNotifier {
  late Job job;
  late List<Job> companyJobs;
  late List latestJobs;
  final Dio dio = Dio();
  List experience = [];
  List skills = [];
  List certificate = [];
  // List get experience => _experience;
  // List get skills => _skills;
  // List get certificate => _certificate;
  // set experience(List value) {
  //   _experience = value;
  //   notifyListeners();
  // }
  // set skills(List value) {
  //   _skills = value;
  //   notifyListeners();
  // }
  // set certificate(List value) {
  //   _certificate = value;
  //   notifyListeners();
  // }
  updet() {
    notifyListeners();
  }

  Future<List<Job>> GetAllCompanyJobs(id) async {
    try {
      Response<List> response = await dio.get(APIRoute.GetAllCompanyJobs(id));
      print(response.data);
      companyJobs = response.data!.map((value) => Job.fromJson(value)).toList();
      print(companyJobs);
      return companyJobs;
    } catch (e) {
      print(e);
      return companyJobs;
    }
  }
  Future<List> getLatestJobs() async {
    try {
      Response response = await dio.get(APIRoute.getLatestJobs);
      print(response.data);
      latestJobs = response.data['jobs']!.map((value) => Job.fromJson(value)).toList();
      print(latestJobs);
      return latestJobs;
    } catch (e) {
      print('the err $e');
      return latestJobs;
    }
  }

  Future<void> refreshJobs() async {
    // await GetAllCompanyJobs(companyId);
    notifyListeners();
  }

  Future<bool> createJob(Job jobData) async {
    try {
      Response res = await dio.post(APIRoute.jobCreate, data: jobData.toJson());
      print(res);
      return true;
    } on DioException catch (e) {
      print(e);
      return false;
    }
  }
}
