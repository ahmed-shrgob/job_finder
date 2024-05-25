import 'package:flutter/material.dart';
import 'package:job_finder/core/model/job_model.dart';
import 'package:job_finder/core/view%20model/jobVM.dart';
import 'package:job_finder/core/view/screens/job_details_screen.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../constants/cons_colors.dart';
import '../../../constants/cons_size.dart';

class JobWidget extends StatelessWidget {
  final Job jobModel;
  // final String jobID;
  final String companyName;
  // final String JobName;
  // final String location;
  // final String createdAt;
  // final String bio;
  JobWidget({
    super.key,
    required this.companyName,
    // required this.JobName,
    // required this.location,
    // required this.createdAt,
    // required this.bio, required this.jobID,
    required this.jobModel,
  });
  final JobVM jobVM = JobVM();

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobScreen(jobModel: jobModel, companyName: companyName,),
                  )),
              child: Container(
                height: width * 0.4,
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
                  children: [
                    Expanded(
                        flex: 4,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Image.asset(
                              'assets/images/google.png',
                              fit: BoxFit.contain,
                            ),
                            backgroundColor: Colors.transparent,
                            radius: width * 0.05,
                          ),
                          title: Text(
                            "${companyName}",
                            style: TextStyle(
                                fontSize: width * 0.035, color: Colors.grey),
                          ),
                          subtitle: Text(
                            '${jobModel.name}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.045),
                          ),
                          trailing: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  '${jobModel.location}',
                                  style: TextStyle(
                                    fontSize: width * 0.03,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  // '${snapshot.data![index].createdAt}',
                                  "${timeago.format(DateTime.parse(jobModel.createdAt!), locale: 'ar')}",
                                  style: TextStyle(
                                    fontSize: width * 0.03,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 5,
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              maxLines: 3,
                              overflow:TextOverflow.ellipsis ,
                              '${jobModel.bio}',
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          trailing: Icon(
                            Icons.bookmark_border_outlined,
                            size: width * 0.1,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
  }
}
