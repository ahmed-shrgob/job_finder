import 'package:flutter/foundation.dart';

class JobDropdownValueProvider extends ChangeNotifier {
  List<String> ceties = [
    'عدن',
    'صنعاء',
    'حضرموت',
    'تعز',
    'شبوة',
    'الحديدة',
    'مأرب',
    'الضالع',
    'المهرة',
    'لحج',
    'عمران',
    'أبين',
    'الجوف',
    'صعدة',
    'سقطرى',
    'حجة',
    'المحويت',
    'البيضاء',
    'إب',
    'ذمار'
  ];
  List<String> workSchedule = [
    'دوام جزئي',
    'دوام كامل'
  ];
  List<String> jobType = [
    'حضوري',
    'عن بعد'
  ];
  String _cityValue = 'عدن';
  String _workSchedule = 'دوام جزئي';
  String _jobType = 'حضوري';

  String get cityValue => _cityValue;
  String get workScheduleValue => _workSchedule;
  String get jobTypeValue => _jobType;

  set cityValue(String value) {
    _cityValue = value;
    notifyListeners();
  }
  set workScheduleValue(String value) {
    _workSchedule = value;
    notifyListeners();
  }
  set jobTypeValue(String value) {
    _jobType = value;
    notifyListeners();
  }
}
