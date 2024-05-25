// import 'package:flutter/material.dart';

// class FilterScreen1 extends StatefulWidget {
//   @override
//   _FilterScreenState createState() => _FilterScreenState();
// }

// class _FilterScreenState extends State<FilterScreen1> {
//   Map<String, bool> category1 = {
//     'Option 1': false,
//     'Option 2': false,
//     'Option 3': false,
//   };

//   Map<String, bool> category2 = {
//     'Option 1': false,
//     'Option 2': false,
//     'Option 3': false,
//   };

//   Map<String, bool> category3 = {
//     'Option 1': false,
//     'Option 2': false,
//     'Option 3': false,
//   };

//   Map<String, bool> category4 = {
//     'Option 1': false,
//     'Option 2': false,
//     'Option 3': false,
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Filter Items'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Card(child: buildExpansionTile('Category 1', category1)),
//             buildExpansionTile('Category 2', category2),
//             buildExpansionTile('Category 3', category3),
//             buildExpansionTile('Category 4', category4),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement filter logic
//               },
//               child: Text('Apply Filter'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 textStyle: TextStyle(fontSize: 18),
//                 padding: EdgeInsets.symmetric(vertical: 12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   ExpansionTile buildExpansionTile(String title, Map<String, bool> options) {
//     return ExpansionTile(
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       children: options.keys.map((String key) {
//         return CheckboxListTile(
//           title: Text(key),
//           value: options[key],
//           onChanged: (bool? value) {
//             setState(() {
//               options[key] = value!;
//             });
//           },
//         );
//       }).toList(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/core/view%20model/filterVM.dart';
import 'package:provider/provider.dart';

class FilterScreen1 extends StatelessWidget {
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
            buildExpansionTile(context, "تاريخ الإعلان", filterModel.selectedCategory1??'',
                ['Option 1', 'Option 2', 'Option 3']),
            buildExpansionTile(context, "المدينة",filterModel.selectedCategory2??'', [
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
                context, "مجال العمل",filterModel.selectedCategory3??'', ['Option 1', 'Option 2', 'Option 3']),
            buildExpansionTile(
                context, "نوع الدوام",filterModel.selectedCategory4??'' ,['Option 1', 'Option 2', 'Option 3']),
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
