import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/view/screens/company_profile_screen.dart';
import 'package:job_finder/core/view/screens/cv_profile_screen.dart';
import 'package:job_finder/core/view/screens/filter_screen.dart';
import 'package:job_finder/core/view/widgets/title_widget.dart';

import '../../../constants/cons_size.dart';
import '../widgets/jobs_widget.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    print(width * 0.07);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: width * 0.05),
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
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              title: Text(
                                "إبحث عن وظيفة احلامك",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.06,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'في اي وقت , ومن اي مكان',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.notifications_none_outlined,
                                  color: Colors.white,
                                  size: width * 0.07,
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.account_circle_rounded,
                                    color: Colors.white,
                                    size: width * 0.1,
                                  ),
                                  onPressed: () {
                                   userType == 'company'
                                        ? Navigator.push(context,
                                            MaterialPageRoute(
                                            builder: (context) {
                                              return CompanyProfilScreen(id: userId!,);
                                            },
                                          ))
                                        : Navigator.push(context,
                                            MaterialPageRoute(
                                            builder: (context) {
                                              return CVProfileScreen();
                                            },
                                          ));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.7,
                            height: width * 0.1,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'ابحث',
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                  // vertical: 10,
                                  horizontal: 20,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return FilterScreen();
                              },
                            )),
                            child: Container(
                              height: width * 0.1,
                              width: width * 0.1,
                              decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.filter_list,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: TitleWidget(
                  text: 'اكثر الشركات متابعة',
                ),
              ),
              Container(
                height: width * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompanyProfilScreen(id: userId!),
                          )),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                        child: Container(
                          width: width * 0.3,
                          height: width * 0.2,
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
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  'assets/images/google.png',
                                  fit: BoxFit.contain,
                                ),
                                backgroundColor: Colors.transparent,
                                radius: width * 0.05,
                              ),
                              Text(
                                'جوجل',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.04),
                              ),
                              Text(
                                '50k followers',
                                style: TextStyle(
                                    fontSize: width * 0.03, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: TitleWidget(
                  text: 'اخر الوظائف المضافة',
                ),
              ),
              // JobWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
