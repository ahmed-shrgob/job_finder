import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/view/screens/loginScreen.dart';
import 'package:job_finder/core/view/screens/user_request_jobs.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المزيد'),
        backgroundColor: AppColor.appBarColor,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              GetStorage().erase();
              userId = null;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            tooltip: 'تسجيل الخروج',
          ),
        ],
      ),
      body: ListView(
        children: [
        userType=='user'?  ListTile(
            leading: Icon(Icons.badge),
            title: Text('الوظائف التي قدمت عليها'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsreRequestJobs(),
                  ));
            },
          ):Container(),
          Divider(),
         userType=='user'?  ListTile(
            leading: Icon(Icons.business_rounded),
            title: Text('وظائف الشركات التي تتابعها'),
            onTap: () {

            },
          ):Container(),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('معلومات التطبيق'),
            onTap: () {

            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
