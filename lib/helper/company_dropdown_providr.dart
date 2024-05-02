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
  String _cityValue = 'عدن';
  String _employeeCountValue = 'اقل من 20';

  String get cityValue => _cityValue;
  String get employeeCountValue => _employeeCountValue;

  set cityValue(String value) {
    _cityValue = value;
    notifyListeners();
  }
  set employeeCountValue(String value) {
    _employeeCountValue = value;
    notifyListeners();
  }
}
