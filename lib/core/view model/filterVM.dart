import 'package:flutter/foundation.dart';

class FilterVM extends ChangeNotifier {
  String? selectedCategory1;
  String? selectedCategory2;
  String? selectedCategory3;
  String? selectedCategory4;

  void selectOption(String category, String option) {
    switch (category) {
      case "تاريخ الإعلان":
        selectedCategory1 = option;
        break;
      case "المدينة":
        selectedCategory2 = option;
        break;
      case "مجال العمل":
        selectedCategory3 = option;
        break;
      case "نوع الدوام":
        selectedCategory4 = option;
        break;
    }
    notifyListeners();
  }
}