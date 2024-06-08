import 'package:flutter/foundation.dart';

class CompanyDropdownValueProvider extends ChangeNotifier {
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
  List<String> employeeCountList = [
    'اقل من 20',
    '20 - 50',
    '50 - 100',
    '100 - 150',
    '150 - 250',
    'اكثر من 250'
  ];
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
  String _employeeCountValue = 'اقل من 20';
  String _categorey = "غير محدد";

  String get cityValue => _cityValue;
  String get employeeCountValue => _employeeCountValue;
  String get categoreyValue => _categorey;

  set cityValue(String value) {
    _cityValue = value;
    notifyListeners();
  }

  set employeeCountValue(String value) {
    _employeeCountValue = value;
    notifyListeners();
  }
  set categoreyValue(String value) {
    _categorey = value;
    notifyListeners();
  }
}
