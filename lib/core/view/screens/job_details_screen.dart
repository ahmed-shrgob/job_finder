import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:job_finder/core/model/job_model.dart';
import 'package:job_finder/core/view/widgets/button.dart';
import 'package:job_finder/core/view/widgets/job_info_widget.dart';
import 'package:job_finder/core/view/widgets/title_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class JobScreen extends StatelessWidget {
  final Job jobModel;
  final String companyName;
  // final String jobTime;
  // final String bio;
  // final String bio;
  // final String bio;
  // final String bio;
  const JobScreen({super.key, required this.jobModel, required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${jobModel.name}'),
        centerTitle: true,
        backgroundColor: AppColor.appBarColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: width,
                decoration: BoxDecoration(
                    gradient: AppColor.gradient,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/google.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        radius: width * 0.06,
                      ),
                      Text(
                        '${companyName}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.05),
                      ),
                      // Text(
                      //   'uoioiuiouio',
                      //   style: TextStyle(
                      //       color: Colors.white, fontSize: width * 0.035),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "${timeago.format(DateTime.parse(jobModel.createdAt!), locale: 'ar')}",
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.035),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TitleWidget(text: 'وصف الوظيفة'),
                  Container(
                    padding: EdgeInsets.all(15),
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${jobModel.bio}'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TitleWidget(text: "الخبرة المطلوبة"),
                  JobInfoWidget(info: jobModel.experience??['غير محدد']),
                  SizedBox(
                    height: 15,
                  ),
                  TitleWidget(text: "المهارات"),
                  JobInfoWidget(info: jobModel.skills??['غير محدد']),
                  SizedBox(
                    height: 15,
                  ),
                  TitleWidget(text: "الشهادات المطلوبة"),
                  JobInfoWidget(info: jobModel.certificate??['غير محدد']),
                  SizedBox(
                    height: 15,
                  ),
                  TitleWidget(text: "تفاصيل الوظيفة"),
                  Container(
                    padding: EdgeInsets.all(15),
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text('منطقة الوظيفة	'),
                            subtitle: Text('${jobModel.location}'),
                          ),
                          ListTile(
                            title: Text('نوع الدوام	'),
                            subtitle: Text('${jobModel.workSchedule}'),
                          ),
                          ListTile(
                            title: Text('الدرجة التعليمية'),
                            subtitle: Text('بكالوريوس'),
                          ),
                          ListTile(
                            title: Text('الراتب الشهري	'),
                            subtitle: Text('${jobModel.salary}'),
                          ),
                          ListTile(
                            title: Text('نوع الوظيفة'),
                            subtitle: Text('${jobModel.type}'),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ButtonWidget(onPressed: () {
              
            }, child: Text('التقديم على الوظيفة'), color: AppColor.mainColor),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
