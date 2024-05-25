import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:job_finder/core/view%20model/userVM.dart';
import 'package:job_finder/core/view/widgets/title_widget.dart';

class AboutUsWidget extends StatelessWidget {
  final String userID;
  AboutUsWidget({super.key, required this.userID});
  final UserVM userVM = UserVM();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: userVM.getUserData(userID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(
                      text: 'نبذة تعريفية',
                    ),
                    Text( '${snapshot.data!.bio}',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Color(0xff8B8B8B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    TitleWidget(text: 'المكان'),
                    Text(
                      // "snapshot.data!.location",
                     '${snapshot.data!.location}',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Color(0xff8B8B8B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    TitleWidget(text: 'مجال العمل'),
                    Text(
                      '${snapshot.data!.categorey}',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Color(0xff8B8B8B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    TitleWidget(text: 'عدد الموظفين'),
                    Text(
                      '${snapshot.data!.employeeCount}',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Color(0xff8B8B8B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    TitleWidget(text: 'تأسس منذ:'),
                    Text(
                      '${snapshot.data!.companyCreateAt}',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Color(0xff8B8B8B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
    );
  }
}
