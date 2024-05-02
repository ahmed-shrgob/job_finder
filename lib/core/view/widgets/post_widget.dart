import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_size.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              left: width * 0.05, right: width * 0.05, top: width * 0.03),
          child: Container(
            width: width * 0.8,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ]),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(
                      'assets/images/google.png',
                      fit: BoxFit.contain,
                    ),
                    backgroundColor: Colors.transparent,
                    radius: width * 0.05,
                  ),
                  title: Text(
                    'جوجل',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.045,
                        color: Colors.black),
                  ),
                  subtitle: Text(
                    'قبل 23 دقيقة',
                    style:
                        TextStyle(color: Colors.grey, fontSize: width * 0.035),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'يُمكن تضمين معلومات إضافية أو ملاحظات في نهاية الوصف الوظيفي بإيجاز، فمثلًا قد يرغب المشرف على كتابة الوصف ذكر طبيعة بيئة العمل أو نسبة المخاطر أو متطلبات الجهد ...',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: width * 0.12,
                  
                  decoration: BoxDecoration(color: Color.fromARGB(73, 147, 117, 255),
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.favorite_border,color: Colors.red,),
                      ),
                      Text('13',style: TextStyle(
                        color: Colors.grey,
                        fontSize: width*0.035,
                        // fontWeight: FontWeight.bold
                      ),),
                      SizedBox(width: width*0.1,),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.comment,color: Colors.grey,),
                      ),
                      Text('9',style: TextStyle(
                        color: Colors.grey,
                        fontSize: width*0.035,
                        // fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
