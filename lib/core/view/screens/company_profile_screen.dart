import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/view%20model/followVM.dart';
import 'package:job_finder/core/view%20model/jobVM.dart';
import 'package:job_finder/core/view%20model/userVM.dart';
import 'package:job_finder/core/view/screens/job_create_screen.dart';
import 'package:job_finder/core/view/widgets/aboutUs_widget.dart';
import 'package:job_finder/core/view/widgets/follow_Widget.dart';
import 'package:job_finder/core/view/widgets/jobs_widget.dart';
import 'package:job_finder/core/view/widgets/post_widget.dart';
import 'package:provider/provider.dart';
import '../../../constants/cons_colors.dart';
import '../../../constants/cons_size.dart';

class CompanyProfilScreen extends StatefulWidget {
  final String id;
  CompanyProfilScreen({super.key, required this.id});

  @override
  State<CompanyProfilScreen> createState() => _CompanyProfilScreenState();
}

class _CompanyProfilScreenState extends State<CompanyProfilScreen> {
  final UserVM userVM = UserVM();
  // final FollowVM followVM = FollowVM();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              FutureBuilder(
                future: userVM.getUserData(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Container(
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
                                '${snapshot.data!.name}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.05),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '${snapshot.data!.categorey}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ),
                              ),
                              userId != widget.id && userId != null
                                  ? Consumer<FollowVM>(
                                      builder: (context, value, child) =>
                                          FutureBuilder(
                                        future: value.checkIfUserFollows(
                                            userId!, widget.id),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData &&
                                              snapshot.connectionState ==
                                                  ConnectionState.done) {
                                            return FollowWidget(
                                              isFollow: value.isFollow,
                                              onTap: ()async {
                                                snapshot.data!
                                                    ?await value.unFollow(
                                                        userId!, widget.id)
                                                    :await value.follow(
                                                        userId!, widget.id);
                                                value.update();
                                              },
                                            );
                                          } else {
                                            return Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: AppColor.primaryColor,
                                            ));
                                          }
                                        },
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ));
                  } else {
                    return Container(
                      height: 100,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: AppColor.primaryColor,
                      )),
                    );
                  }
                },
              ),
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
                          child: Text('الوظائف'),
                        ),
                        Text('المنشورات'),
                        Text('نبذة عننا'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(children: [
                Consumer<JobVM>(builder: (context, value, child) {
                  return FutureBuilder(
                    future: value.GetAllCompanyJobs(widget.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return SingleChildScrollView(
                          child: ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return JobWidget(
                                companyName: userVM.user.name!,
                                jobModel: snapshot.data![index],
                              );
                            },
                          ),
                        );
                      } else if (snapshot.connectionState ==
                              ConnectionState.done &&
                          !snapshot.hasData) {
                        return Text('لم تنشر هذه الجهة اي وظائف بعد');
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
                // PostWidget(),
                AboutUsWidget(
                  userID: widget.id,
                ),
              ]))
            ],
          ),
          floatingActionButton: userType == 'company' && userId == widget.id
              ? Consumer<JobVM>(
                  builder: (context, v, child) {
                    return FloatingActionButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateJobScreen(),
                          )).then((value) {
                        value == true ? v.refreshJobs() : null;
                      }),
                      backgroundColor: AppColor.mainColor,
                      child: Container(
                        child: Icon(Icons.add),
                      ),
                    );
                  },
                )
              : null,
        ),
      ),
    );
  }
}
