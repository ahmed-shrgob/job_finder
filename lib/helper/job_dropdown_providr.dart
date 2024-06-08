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
  List<String> workSchedule = ['دوام جزئي', 'دوام كامل'];
  List<String> jobType = ['حضوري', 'عن بعد'];
  List<String> categories = [
    "غير محدد",
    "التكنولوجيا والمعلومات",
    "الرعاية الصحية",
    "الهندسة",
    "التعليم",
    "التمويل والمحاسبة",
    "التسويق والإعلان",
    "القانون",
    "الإدارة والأعمال",
    "الفنون والإعلام",
    "الصناعة والتصنيع",
    "الضيافة والسياحة",
    "العلوم والأبحاث",
    "البناء والعقارات",
    "الزراعة والبيئة",
    "الخدمات الاجتماعية",
    "التجارة والتجزئة"
  ];
  String _cityValue = 'عدن';
  String _workSchedule = 'دوام جزئي';
  String _jobType = 'حضوري';
  String _categorey = "غير محدد";

  String get cityValue => _cityValue;
  String get workScheduleValue => _workSchedule;
  String get jobTypeValue => _jobType;
  String get categoreyValue => _categorey;

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

  set categoreyValue(String value) {
    _categorey = value;
    notifyListeners();
  }
}
