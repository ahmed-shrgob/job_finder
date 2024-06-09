import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/view%20model/request_VM.dart';
import 'package:job_finder/core/view/widgets/jobs_widget.dart';
import 'package:provider/provider.dart';

class UsreRequestJobs extends StatelessWidget {
  const UsreRequestJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('الوظائف التي قدمت عليها'),
        backgroundColor: AppColor.appBarColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Consumer<RequstVM>(builder: (context, value, child) {
                return FutureBuilder(
                  future: value.getRequestsByUserId(userId!),
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
    );
  }
}