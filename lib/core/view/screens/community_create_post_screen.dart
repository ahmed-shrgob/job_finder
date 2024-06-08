import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/model/Blogs.dart';
import 'package:job_finder/core/view%20model/blogsVm.dart';
import 'package:provider/provider.dart';

class CommunityCreatePostScreen extends StatelessWidget {
  final String categoeryName;
  CommunityCreatePostScreen({super.key, required this.categoeryName});
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final blogVM = Provider.of<BlogVm>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('اضافة منشور'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'منشور لمجتمع $categoeryName',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _textController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText:
                      'اكتب سؤال تحتاج مساعدة فيه او معلومة تفيد زوار المجتمع!',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_textController.text.isNotEmpty) {
                    if (await blogVM.CreateBlog(BlogsModel(
                        body: _textController.text,
                        author: userId,
                        Categorey: categoeryName,
                        type: userType))) {
                      Navigator.pop(context, true);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('تم اضافة المنشور')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('حدث خطأ..تأكد من اتصالك بالانترنت')));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Center(
                  child: Text(
                    'نشر',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
