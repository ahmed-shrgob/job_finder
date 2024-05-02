import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/core/view/widgets/post_widget.dart';

class CommunityInsideScreen extends StatelessWidget {
  const CommunityInsideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('مجتمع البرمجة'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.appBarColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    indicator: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 2),
                        child: Text('الشركات'),
                      ),
                      Text('الاشخاص'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: TabBarView(children: [
              PostWidget(),
              PostWidget(),
            ]))
          ],
        ),
      ),
    );
  }
}
