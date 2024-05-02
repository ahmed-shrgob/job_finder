import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:job_finder/core/view/widgets/title_widget.dart';

class FilterWidget extends StatelessWidget {
  final List<Map<String, String>> info;
  FilterWidget({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            // shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: info.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  // contentPadding: EdgeInsets.all(2),
                  title: TitleWidget(text: info[index]['title']!),
                  trailing: Text(
                    info[index]['subtitle']!,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.037),
                  ),
                ),
              );
            }));
  }
}
