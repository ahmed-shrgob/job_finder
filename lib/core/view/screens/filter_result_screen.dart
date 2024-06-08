import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/core/view%20model/filterVM.dart';
import 'package:job_finder/core/view/widgets/jobs_widget.dart';
import 'package:provider/provider.dart';

class FilterResultScreen extends StatelessWidget {
  const FilterResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نتيجة الفلترة'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Consumer<FilterVM>(builder: (context, value, child) {
        return FutureBuilder(
          future: value.filter(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data.length == 0) {
              return Center(child: Text("لا توجد بيانات تطابق الفلترة"));
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return JobWidget(
                          companyName: "${snapshot.data![index].companyName}",
                          jobModel: snapshot.data![index],
                        );
                      },
                    ),
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasError) {
              return Center(child: Text('تأكد من اتصالك بالانترنت'));
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
    );
  }
}
