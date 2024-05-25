import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/view%20model/request_VM.dart';
import 'package:job_finder/core/view/screens/cv_profile_screen.dart';
import 'package:job_finder/core/view/widgets/Request_widget.dart';

class CompanyRequestsScreen extends StatelessWidget {
  CompanyRequestsScreen({super.key});
  final RequstVM req = RequstVM();
  @override
  Widget build(BuildContext context) {
    //  RequstVM req = Provider.of<RequstVM>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('طلبات الوظائف'),
          backgroundColor: AppColor.appBarColor,
        ),
        body: FutureBuilder(
          future: req.getJobsByCompanyId(userId!),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              print(snapshot.data);
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => RequestWidget(
                  text: '${snapshot.data![index].userRequestName}',
                  subtitle: '${snapshot.data![index].jobName}',
                  imageUrl: '',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CVProfileScreen(
                              id: snapshot.data![index].userId!),
                        ));
                  },
                ),
              );
            } else {
              print(snapshot.data);
              return Center(
                  child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ));
            }
          },
        ));
  }
}
