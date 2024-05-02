import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';

class SavedJobScreen extends StatelessWidget {
  const SavedJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('الوضائف المحفوظة'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.appBarColor,
        ),
        body: SingleChildScrollView(child: Container()),
    );
  }
}