import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/core/view%20model/jobVM.dart';
import 'package:job_finder/core/view/widgets/jobs_widget.dart';
import 'package:job_finder/core/view/widgets/search_Widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    final jobVM = Provider.of<JobVM>(context);

    return Scaffold(
        backgroundColor: Color(0xff123456),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      padding: EdgeInsets.only(top: 15),
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      )),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SearchInput(
                        onChanged: (value) {
                          searchText = value;
                          print(searchText);
                          jobVM.updet();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Consumer<JobVM>(builder: (context, value, child) {
                  return searchText.isEmpty
                      ? Center(child: Icon(Icons.search,size: 70,color: Colors.white,))
                      : FutureBuilder(
                          future: value.searchJobs(searchText),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.hasData) {
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      // reverse: true,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        return JobWidget(
                                          companyName:
                                              "${snapshot.data![index].companyName}",
                                          jobModel: snapshot.data![index],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                !snapshot.hasData) {
                              return Text('تأكد من اتصالك بالانترنت');
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.primaryColor,
                                ),
                              );
                            }
                          },
                        );
                }),
              )
            ],
          ),
        ));
  }
}
