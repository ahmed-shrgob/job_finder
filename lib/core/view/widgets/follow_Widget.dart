import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_size.dart';

class FollowWidget extends StatelessWidget {
  final bool isFollow;
  final void Function()? onTap;
  const FollowWidget({super.key, required this.isFollow, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isFollow ? width * 0.3 : width * 0.2,
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
            color: isFollow
                ? Color.fromARGB(73, 255, 255, 255)
                : AppColor.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                isFollow ? Icons.check_box_outlined : Icons.add_box_outlined,
                size: width * 0.05,
                color: Colors.white,
              ),
              Text(
                isFollow ? 'إلغاء المتابعة' : 'متابعة',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.035),
              ),
            ]),
      ),
    );
  }
}
