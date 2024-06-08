import 'package:flutter/material.dart';
import 'package:job_finder/core/view/widgets/cv_widget.dart';

class CVAddButtonWidget extends StatelessWidget {
  final List cvList;
  final Widget textFormWidget;
  final bool isEdit;
  final void Function()? onPressed;
  const CVAddButtonWidget(
      {super.key,
      required this.cvList,
      required this.textFormWidget,
      required this.onPressed, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return CVWidget(
        info: cvList,
        widget: TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Container(
                  width: 150,
                  height: 210,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      textFormWidget,
                      TextButton(
                        onPressed: onPressed,
                        child: Container(
                          height: 20,
                          // width: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.add), Text('إضافة')],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          child: Container(
            height: 20,
            // width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.add), Text('إضافة')],
            ),
          ),
        ), isEdit: isEdit,);
  }
}
