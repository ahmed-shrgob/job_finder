import 'package:dio/dio.dart';
import 'package:job_finder/constants/cons_API.dart';
import 'package:job_finder/core/model/Communtytype.dart';

class CommuntyVm {
  late List<CommuntyType> communtyType;

  Dio dio = Dio();
  Future<List> getCommunty() async {
    try {
      Response response = await dio.get(APIRoute.getCommuntis);

      communtyType = (response.data as List)
          .map((value) => CommuntyType.formJosn(value))
          .toList();
      print(response.data);
    } catch (e) {
      ("هذه الخطاء${e}");
    }

    return communtyType;
  }
}
