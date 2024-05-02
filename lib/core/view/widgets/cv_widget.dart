import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:job_finder/core/view%20model/cv_VM.dart';
import 'package:provider/provider.dart';

class CVWidget extends StatelessWidget {
  final List info;
  final Widget? widget;
  final bool isEdit;
  CVWidget({super.key, required this.info, this.widget, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    final cvVM = Provider.of<CVVM>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
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
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: info.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\u2022  ${info[index]}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.037),
                          ),
                          isEdit
                              ? IconButton(
                                  onPressed: () {
                                    cvVM.deleteFromList(index, info);
                                  },
                                  icon: Icon(
                                    Icons.delete_rounded,
                                    color: Colors.red,
                                  ))
                              : Container()
                        ],
                      );
                    }),
                Container(
                  child: widget,
                )
              ],
            )));
  }
}
