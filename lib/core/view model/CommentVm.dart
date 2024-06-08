// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';

// class CommentVm extends ChangeNotifier {
//   Dio dio = Dio();
//   // int? index;
//   CommentModel commentModel = CommentModel();
//   List<dynamic> _CommentList = [];
//   List<CommentModel> get CommentList {
//     return [..._CommentList];
//   }

//   List<CommentModel> fetch = [];

//   Future<dynamic> getComment(blogId) async {
//     try {
//       Response response = await dio.get(AppRoute.getCommentUrl(blogId));
//       final List<CommentModel> fetch = [];
//       List res = response.data;

     
//       _CommentList =
//           response.data.map((value) => CommentModel.formJosn(value)).toList();

//       print(response.statusCode);
//       // _CommentList = fetch;
//     } catch (e) {
//       print("${e} هذا الخطاء");
//     }
//   }

//   Future<bool> CreateCommnt(CommentModel commentModel) async {
//     try {
//       Response response = await dio.post(AppRoute.CreateCommentUrl,
//           data: commentModel.toJosn());
//       if (response.statusCode == 201) {
//         print("تم انشاء الكومنت");
//         return true;
//       } else {
//         print("فشل الكومنت");
//         return false;
//       }
//     } catch (e) {
//       print(e);
//     }
//     // notifyListeners();
//     return true;
//   }

//   Future<bool> deleteCommnet(IdCommnet) async {
//     Response response = await dio.delete(AppRoute.deleteComentUrl(IdCommnet));
//     if (response.statusCode == 200) {
//       print("تمت عملية الحذف");
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Update() {
//     notifyListeners();
//   }
// }
