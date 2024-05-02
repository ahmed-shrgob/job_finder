import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_size.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
    );
  }
}
