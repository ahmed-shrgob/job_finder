import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/view/screens/loginScreen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () async {
              GetStorage().erase();
              // GetStorage().changes;
              userId=null;
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
            child: Text('More Screen...')),
      ),
    );
  }
}
