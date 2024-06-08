import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:job_finder/constants/cons_API.dart';
import 'package:job_finder/core/model/Blogs.dart';

class BlogVm extends ChangeNotifier {
  Dio dio = Dio();
  BlogsModel blogsModel = BlogsModel();
  List allBlogs = [];
  List allBlogsUser = [];
  List allPubilcation = [];
  Future getArticlesByType(
      {required String userType, required String categoeryName}) async {
    try {
      Response response = await dio.get(APIRoute.getArticlesByType,
          data: {"userType": userType, "blogCategorey": categoeryName});
      allBlogs = (response.data['articles'] as List)
          .map((e) => (BlogsModel.formjosn(e)))
          .toList();
    } catch (e) {
      print("${e}");
    }

    return allBlogs;
  }

  // Future<dynamic> fetchAllBlogsUser() async {
  //   try {
  //     Response response = await dio.get(AppRoute.getUserBlogsUser);
  //     List res = response.data['articles'];
  //     print(response.statusCode);
  //     allBlogsUser = response.data['articles']
  //         .map((e) => (BlogsModel.formjosn(e)))
  //         .toList();
  //   } catch (e) {
  //     print("${e}");
  //   }

  //   return allBlogsUser;
  // }

  Future<List> getUserBlogs(iD) async {
    try {
      Response response = await dio.get(APIRoute.getUserBlogs(iD));
      allPubilcation =
          response.data.map((e) => (BlogsModel.formjosn(e))).toList();
      print(allPubilcation);
    } catch (e) {
      print(e);
    }
    return allPubilcation;
  }

  Future<bool> CreateBlog(BlogsModel blogsModel) async {
    Response response =
        await dio.post(APIRoute.createBlog, data: blogsModel.toJosn());
    if (response.statusCode == 201) {
      print("تم انشاء المنشور");

      return true;
    } else {
      print("فشل  انشاء المنشور");
      return false;
    }
  }

  // Future<bool> editBlog(String title, String body, IdBlogss) async {
  //   Map<String, dynamic> Josn = {
  //     "title": title,
  //     "body": body,
  //     "_id": IdBlogss,
  //   };

  //   Response response =
  //       await dio.put(AppRoute.EditBlogUrl(IdBlogss), data: Josn);

  //   if (response.statusCode == 200) {
  //     print("تم تعديل المنشور");
  //     return true;
  //   } else {
  //     print(" فشل التعديل");
  //     return false;
  //   }
  // }

  // Future<bool> deleteBlog(IdBlogss) async {
  //   Response response = await dio.delete(AppRoute.deleteBlogUrl(IdBlogss));
  //   if (response.statusCode == 200) {
  //     print("تمت عماية الحذف بنجاح");
  //     return true;
  //   } else {
  //     print("فشلت عملية الحذف");
  //     return false;
  //   }
  // }

  update() {
    notifyListeners();
  }
}
