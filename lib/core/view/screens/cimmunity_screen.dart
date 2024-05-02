import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:job_finder/core/view/screens/community_inside_screen.dart';
import 'package:job_finder/core/view/widgets/title_widget.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('المجتمعات'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.appBarColor,
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          itemCount: 10,
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommunityInsideScreen(),
                )),
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
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: Icon(
                          Icons.group,
                          size: width * 0.2,
                          color: Colors.grey,
                        ),
                      )),
                  Expanded(
                      child: Container(
                    child: TitleWidget(text: 'البرمجة'),
                  )),
                ],
              ),
            ),
          ),
        ));
  }
}
