import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:job_finder/core/view%20model/CommuntyVm.dart';
import 'package:job_finder/core/view/screens/community_inside_screen.dart';
import 'package:job_finder/core/view/widgets/title_widget.dart';

class CommunityScreen extends StatelessWidget {
   CommunityScreen({super.key});
final CommuntyVm communtyVm=CommuntyVm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('المجتمعات'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.appBarColor,
        ),
        body:
        FutureBuilder(future: communtyVm.getCommunty(), builder: (context, snapshot) {
          if (snapshot.connectionState==ConnectionState.done&&snapshot.hasData) {
            return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommunityInsideScreen(communtyName: "${snapshot.data![index].name}",),
                )),
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
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: Icon(
                          Icons.group,
                          size: width * 0.2,
                          color: Colors.grey,
                        ),
                      )),
                  Expanded(
                      child: Container(
                    child: TitleWidget(text: '${snapshot.data![index].name}'),
                  )),
                ],
              ),
            ),
          ),
        );
          } else {
            return Center(child: CircularProgressIndicator(color: AppColor.mainColor,));
          }
        },)
         );
  }
}
