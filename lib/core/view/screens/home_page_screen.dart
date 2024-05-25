import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/view%20model/jobVM.dart';
import 'package:job_finder/core/view/screens/company_profile_screen.dart';
import 'package:job_finder/core/view/screens/company_requests_screen.dart';
import 'package:job_finder/core/view/screens/cv_profile_screen.dart';
import 'package:job_finder/core/view/screens/filter_screen.dart';
import 'package:job_finder/core/view/screens/search_screen.dart';
import 'package:job_finder/core/view/widgets/button.dart';
import 'package:job_finder/core/view/widgets/title_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/cons_size.dart';
import '../widgets/jobs_widget.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    print(width * 0.07);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: width * 0.05),
                width: width,
                decoration: BoxDecoration(
                    gradient: AppColor.gradient,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(bottom: width * 0.05),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              title: Text(
                                "إبحث عن وظيفة احلامك",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.06,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'في اي وقت , ومن اي مكان',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.notifications_none_outlined,
                                  color: Colors.white,
                                  size: width * 0.07,
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.account_circle_rounded,
                                    color: Colors.white,
                                    size: width * 0.1,
                                  ),
                                  onPressed: () {
                                    if (userType == 'company') {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return CompanyProfilScreen(
                                            id: userId!,
                                          );
                                        },
                                      ));
                                    }
                                    if (userType == 'user') {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return CVProfileScreen(
                                            id: userId!,
                                          );
                                        },
                                      ));
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () =>
                                Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SearchScreen();
                              },
                            )),
                            child: Container(
                              height: width * 0.1,
                              width: width * 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(Icons.search,
                                  color: AppColor.primaryColor),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return FilterScreen();
                              },
                            )),
                            child: Container(
                              height: width * 0.1,
                              width: width * 0.1,
                              decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.filter_list,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
           userType=='company'?   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: JobsRequstsButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompanyRequestsScreen(),
                          ));
                    },
                    text: 'طلبات الوظائف ',
                  ),
                ),
              ):Container(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: TitleWidget(
                  text: 'اكثر الشركات متابعة',
                ),
              ),
              Container(
                height: width * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CompanyProfilScreen(id: userId!),
                          )),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                        child: Container(
                          width: width * 0.3,
                          height: width * 0.2,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  'assets/images/google.png',
                                  fit: BoxFit.contain,
                                ),
                                backgroundColor: Colors.transparent,
                                radius: width * 0.05,
                              ),
                              Text(
                                'جوجل',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.04),
                              ),
                              Text(
                                '50k followers',
                                style: TextStyle(
                                    fontSize: width * 0.03, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: TitleWidget(
                  text: 'اخر الوظائف المضافة',
                ),
              ),
              // JobWidget(),
              Consumer<JobVM>(builder: (context, value, child) {
                return FutureBuilder(
                  future: value.getLatestJobs(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return SingleChildScrollView(
                        child: ListView.builder(
                          // reverse: true,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return JobWidget(
                              companyName:
                                  "${snapshot.data![index].companyName}",
                              jobModel: snapshot.data![index],
                            );
                          },
                        ),
                      );
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        !snapshot.hasData) {
                      return Text('تأكد من اتصالك بالانترنت');
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      );
                    }
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
