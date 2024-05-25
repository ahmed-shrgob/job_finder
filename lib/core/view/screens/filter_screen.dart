// import 'package:flutter/material.dart';
// import 'package:job_finder/constants/cons_colors.dart';
// import 'package:job_finder/constants/cons_size.dart';
// import 'package:job_finder/core/view/widgets/filter_wdget.dart';

// class FilterScreen extends StatelessWidget {
//   const FilterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('فلتر'),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: AppColor.appBarColor,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FilterWidget(
//               info: [
//                 {"title": "تاريخ الإعلان", "subtitle": "أي وقت >"},
//                 {"title": "المدينة", "subtitle": "2 محدد >"},
//                 {"title": "مجال العمل", "subtitle": "أي وقت >"},
//                 {"title": "الجنس", "subtitle": "أي وقت >"},
//                 {"title": "نوع الدوام", "subtitle": "1 محدد >"},
//                 {"title": "مستوى الشهادة", "subtitle": "1 محدد >"},
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(vertical: width*0.05,horizontal: width*0.1),
//             height: width * 0.2,
//             width: double.infinity,
//             color: Colors.white,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                   backgroundColor: AppColor.primaryColor),
//               onPressed: () {},
//               child: Text('234 وضيفة متاحة',style: TextStyle(fontWeight: FontWeight.bold),),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/core/view%20model/filterVM.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filterModel = Provider.of<FilterVM>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text('فلتر'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildExpansionTile(
                context,
                "تاريخ الإعلان",
                filterModel.selectedCategory1 ?? '',
                ['Option 1', 'Option 2', 'Option 3']),
            buildExpansionTile(
                context, "المدينة", filterModel.selectedCategory2 ?? '', [
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
            ]),
            buildExpansionTile(
                context,
                "مجال العمل",
                filterModel.selectedCategory3 ?? '',
                ['Option 1', 'Option 2', 'Option 3']),
            buildExpansionTile(
                context,
                "نوع الدوام",
                filterModel.selectedCategory4 ?? '',
                ['Option 1', 'Option 2', 'Option 3']),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement filter logic
                // You can access the selected options using the Provider

                print('Selected options:');
                print('Category 1: ${filterModel.selectedCategory1}');
                print('Category 2: ${filterModel.selectedCategory2}');
                print('Category 3: ${filterModel.selectedCategory3}');
                print('Category 4: ${filterModel.selectedCategory4}');
              },
              child: Text('تفعيل الفلترة'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: AppColor.primaryColor,
                textStyle: TextStyle(fontSize: 18),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ExpansionTile buildExpansionTile(BuildContext context, String title,
      String subtitle, List<String> options) {
    return ExpansionTile(
      subtitle: Text(
        subtitle,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: options.map((String option) {
        return Consumer<FilterVM>(
          builder: (context, filterModel, child) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: getSelectedOption(filterModel, title),
              onChanged: (String? value) {
                filterModel.selectOption(title, value!);
              },
            );
          },
        );
      }).toList(),
    );
  }

  String? getSelectedOption(FilterVM filterModel, String category) {
    switch (category) {
      case "تاريخ الإعلان":
        return filterModel.selectedCategory1;
      case "المدينة":
        return filterModel.selectedCategory2;
      case "مجال العمل":
        return filterModel.selectedCategory3;
      case "نوع الدوام":
        return filterModel.selectedCategory4;
      default:
        return null;
    }
  }
}
