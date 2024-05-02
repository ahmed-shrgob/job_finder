import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/core/view/screens/cimmunity_screen.dart';
import 'package:job_finder/core/view/screens/filter_screen.dart';
import 'package:job_finder/core/view/screens/home_page_screen.dart';
import 'package:job_finder/core/view/screens/more_screen.dart';
import 'package:job_finder/core/view/screens/saved_jobs_Screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomePageScreen(),
    FilterScreen(),
    CommunityScreen(),
    SavedJobScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(
              icon: Icons.home,
            ),
            TabItem(
              icon: Icons.chat_outlined,
            ),
            TabItem(
              icon: Icons.group,
            ),
            TabItem(
              icon: Icons.bookmark,
            ),
            TabItem(
              icon: Icons.more_horiz_rounded,
            ),
          ],
          backgroundColor: AppColor.mainColor,
          onTap: (index) {
            currentIndex = index;
            setState(() {
              
            });
          } 
        ));
  }
}
