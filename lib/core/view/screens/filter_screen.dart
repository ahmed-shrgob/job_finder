import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:job_finder/core/view/widgets/filter_wdget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('فلتر'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.appBarColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: FilterWidget(
              info: [
                {"title": "تاريخ الإعلان", "subtitle": "أي وقت >"},
                {"title": "المدينة", "subtitle": "2 محدد >"},
                {"title": "مجال العمل", "subtitle": "أي وقت >"},
                {"title": "الجنس", "subtitle": "أي وقت >"},
                {"title": "نوع الدوام", "subtitle": "1 محدد >"},
                {"title": "مستوى الشهادة", "subtitle": "1 محدد >"},
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: width*0.05,horizontal: width*0.1),
            height: width * 0.2,
            width: double.infinity,
            color: Colors.white,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  backgroundColor: AppColor.primaryColor),
              onPressed: () {},
              child: Text('234 وضيفة متاحة',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          )
        ],
      ),
    );
  }
}
