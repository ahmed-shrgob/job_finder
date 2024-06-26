import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/view%20model/cv_VM.dart';
import 'package:job_finder/core/view/screens/chat_screen.dart';
import 'package:job_finder/core/view/screens/cv_create_edit_screen.dart';
import 'package:job_finder/core/view/widgets/button.dart';
import 'package:job_finder/core/view/widgets/cv_widget.dart';
import 'package:job_finder/core/view/widgets/title_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CVProfileScreen extends StatelessWidget {
  final String id;
  bool providerListener = false;
  CVProfileScreen({super.key, required this.id});
  // CVVM cv = CVVM();
  @override
  Widget build(BuildContext context) {
    final cv = Provider.of<CVVM>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('CV'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.appBarColor,
          actions: [
            userType == 'company'
                ? TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            name: '${cv.cv.fullName}',
                            id: id,
                          ),
                        )),
                    child: Text(
                      'مراسلة المتقدم',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ))
                : Container()
          ],
        ),
        body: Consumer<CVVM>(
          builder: (context, cv, child) {
            return FutureBuilder(
              future: cv.getCV(id),
              builder: (context, snapshot) {
                print(snapshot.data);
                print(snapshot.connectionState);
                print(snapshot.error);
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: width,
                            decoration: BoxDecoration(
                                gradient: AppColor.gradient,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: width * 0.05),
                              child: Column(
                                children: [
                                  //  Container(
                                  //   alignment: Alignment.centerRight,
                                  //   width: double.infinity,
                                  //   child: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),onPressed: () {
                                  //     Navigator.pop(context);
                                  //   },),
                                  // ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.account_circle_rounded,
                                            color: Colors.white,
                                            size: width * 0.15,
                                          ),
                                          title: Text(
                                            '${snapshot.data!.fullName}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.05,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(
                                            'مهندس كمبيوتر',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      userId == id
                                          ? Expanded(
                                              child: InkWell(
                                              onTap: () {
                                                cv.certificate=cv.cv.certificate??[];
                                                cv.skills=cv.cv.skills??[];
                                                cv.experience=cv.cv.experience??[];
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          CVCreateEditScreen(
                                                        fullName: snapshot
                                                            .data!.fullName,
                                                        cvId: snapshot.data!.id,
                                                        email: snapshot
                                                            .data!.email,
                                                        address: snapshot
                                                            .data!.address,
                                                        phone: snapshot
                                                            .data!.phone,
                                                        certificate: snapshot
                                                            .data!.certificate!,
                                                        experience: snapshot
                                                            .data!.experience!,
                                                        skills: snapshot
                                                            .data!.skills!,
                                                        isEdit: true,
                                                      ),
                                                    )).then((value) {
                                                  if (value) {
                                                    cv.update();
                                                  }
                                                });
                                              },
                                              child: Container(
                                                margin: EdgeInsets.all(8),
                                                width: width * 0.1,
                                                height: width * 0.07,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.1),
                                                        spreadRadius: 1,
                                                        blurRadius: 3,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                    color: Color.fromARGB(
                                                        73, 255, 255, 255),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.edit,
                                                        size: width * 0.05,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        'تعديل',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                width * 0.035),
                                                      ),
                                                    ]),
                                              ),
                                            ))
                                          : Container(),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TitleWidget(
                            text: 'معلومات عامة',
                          ),
                        ),
                        CVWidget(info: [
                          'العنوان : ${snapshot.data!.address}',
                          'البريد الاكتروني : ${snapshot.data!.email}',
                          'تاريخ الميلاد : 2000\\10\\30',
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TitleWidget(
                            text: 'المهارات',
                          ),
                        ),
                        CVWidget(info: snapshot.data!.skills!),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TitleWidget(
                            text: 'الشهادات',
                          ),
                        ),
                        CVWidget(info: snapshot.data!.certificate!),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TitleWidget(
                            text: 'الخبرات العملية',
                          ),
                        ),
                        CVWidget(info: snapshot.data!.experience!),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  );
                } else if (snapshot.data == null &&
                    snapshot.connectionState == ConnectionState.done &&
                    userId == id) {
                  print(snapshot.error);
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/cv-vector.png',
                          width: 200,
                        ),
                        Container(
                          width: 150,
                          child: ButtonWidget(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CVCreateEditScreen(
                                        certificate: [],
                                        experience: [],
                                        skills: [],
                                        isEdit: false,
                                      ),
                                    )).then((value) {
                                  if (value) {
                                    cv.update();
                                  }
                                });
                              },
                              child: Text('انشاء سيرة ذاتية'),
                              color: AppColor.mainColor),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Center(child: Text('تاكد من اتصالك بالانترنت'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          },
        ));
  }
}
