import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/view%20model/blogsVm.dart';
import 'package:job_finder/core/view/screens/community_create_post_screen.dart';
import 'package:job_finder/core/view/widgets/post_widget.dart';
import 'package:provider/provider.dart';

class CommunityInsideScreen extends StatelessWidget {
  final String communtyName;
  const CommunityInsideScreen({super.key, required this.communtyName});

  @override
  Widget build(BuildContext context) {
    final blogVM = Provider.of<BlogVm>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('مجتمع ${communtyName}'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.appBarColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    indicator: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 2),
                        child: Text('الشركات'),
                      ),
                      Text('الاشخاص'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Consumer<BlogVm>(
              builder: (context, value, child) => TabBarView(children: [
                FutureBuilder(
                  future: value.getArticlesByType(
                      userType: "company", categoeryName: communtyName),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => PostWidget(
                          blog: snapshot.data![index],
                          userName: '${snapshot.data![index].userName}',
                          userImage: snapshot.data![index].userImage,
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColor.mainColor,
                        ),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: value.getArticlesByType(
                      userType: "user", categoeryName: communtyName),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => PostWidget(
                          blog: snapshot.data![index],
                          userName: '${snapshot.data![index].userName}',
                          userImage: snapshot.data![index].userImage,
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColor.mainColor,
                        ),
                      );
                    }
                  },
                ),
              ]),
            ))
          ],
        ),
        floatingActionButton:userId!=null? FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CommunityCreatePostScreen(
                  categoeryName: communtyName,
                ),
              )).then((v) => v == true ? blogVM.update() : null),
          backgroundColor: AppColor.mainColor,
          child: Container(
            child: Icon(Icons.add),
          ),
        ):null,
      ),
    );
  }
}
