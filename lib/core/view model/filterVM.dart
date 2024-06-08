import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:job_finder/constants/cons_API.dart';
import 'package:job_finder/core/model/job_model.dart';

class FilterVM extends ChangeNotifier {
  final _dio = Dio();
  late List filterList;
  String? createdAt;
  String? location;
  String? categorey;
  String? workSchedule;
  String? jobType;

  void selectOption(String category, String? option) {
    print("opshhh = $option");
    switch (category) {
      case "تاريخ الإعلان":
        createdAt = option;
        break;
      case "المدينة":
        location = option;
        break;
      case "مجال العمل":
        categorey = option;
        break;
      case "نوع الدوام":
        workSchedule = option;
      case "نوع الوظيفة":
        jobType = option;
        break;
        
    }
    notifyListeners();
  }

  String? getDate(String? option) {
    if (option == 'اليوم')
      return DateTime.now().subtract(Duration(days: 1)).toString();
    if (option == 'منذ اسبوع')
      return DateTime.now().subtract(Duration(days: 7)).toString();
    if (option == 'شهر')
      return DateTime.now().subtract(Duration(days: 30)).toString();
    else
      return null;
  }

  Future filter() async {
    try {
      Response response = await _dio.post(APIRoute.filter, data: {
        "location": location,
        "workSchedule": workSchedule,
        "type": jobType,
        "Categorey": categorey,
        "createdAt": getDate(createdAt),
      });
      print(response.data);
      filterList =
          response.data['jobs']!.map((value) => Job.fromJson(value)).toList();
      print(filterList);
      return filterList;
    } catch (e) {
      print('the err $e');
      return filterList;
    }
  }
update(){
  notifyListeners();
}
  
  void mekeValuesNull() {
    createdAt = null;
    location = null;
    categorey = null;
    workSchedule = null;
    jobType = null;
    notifyListeners();
  }
}
