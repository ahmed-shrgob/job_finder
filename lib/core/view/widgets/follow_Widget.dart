import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_size.dart';

class FollowWidget extends StatelessWidget {
  const FollowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.2,
      height: width * 0.07,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
          color: Color.fromARGB(73, 255, 255, 255),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.add_box_outlined,
              size: width * 0.05,
              color: Colors.white,
            ),
            Text(
              'متابعة',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.035),
            ),
          ]),
    );
  }
}
