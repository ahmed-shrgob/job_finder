import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final Color? color;
  const ButtonWidget(
      {super.key,
      required this.onPressed,
      required this.child,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
                padding: EdgeInsetsDirectional.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: color),
            onPressed: onPressed,
            child: child),
      ),
    );
  }
}



class JobsRequstsButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const JobsRequstsButton(
      {required this.text, required this.onPressed, Key? key})
      : super(key: key);

  final double borderRadius = 25;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: AppColor.gradient),
        child: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                alignment: Alignment.center,
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                    horizontal: 25,vertical: 10)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)),
                )),
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),
            )));
  }
}