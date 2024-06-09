import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/model/Blogs.dart';
import 'package:job_finder/core/view%20model/LikeVm.dart';
import 'package:job_finder/core/view%20model/blogsVm.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostWidget extends StatelessWidget {
  final BlogsModel blog;
  final String userName;
  final String? userImage;
  const PostWidget(
      {super.key,
      required this.blog,
      required this.userName,
      required this.userImage});

  @override
  Widget build(BuildContext context) {
    final likeVm = Provider.of<LikeVm>(context);
    final blogVm = Provider.of<BlogVm>(context);
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.05, right: width * 0.05, top: width * 0.03),
      child: Container(
        width: width * 0.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
            ]),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Image.asset(
                  'assets/images/google.png',
                  fit: BoxFit.contain,
                ),
                backgroundColor: Colors.transparent,
                radius: width * 0.05,
              ),
              title: Text(
                '${userName}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.045,
                    color: Colors.black),
              ),
              subtitle: Text(
                "${timeago.format(DateTime.parse(blog.createdAt!), locale: 'ar')}",
                style: TextStyle(color: Colors.grey, fontSize: width * 0.035),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${blog.body}',
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: width * 0.12,
              decoration: BoxDecoration(
                  color: Color.fromARGB(92, 114, 225, 245),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: IconButton(
                      onPressed: () {
                        likeVm.AddLike(userId!, blog.id!);
                        blog.isliked = !blog.isliked!;
                        if (blog.isliked!) {
                      blog.likes=    blog.likes!+1;
                        } else {
                       blog.likes=   blog.likes!-1;
                        }
                        // blogVm.update();
                        likeVm.Update();
                      },
                      icon: Icon(
                        blog.isliked! ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    '${blog.likes}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: width * 0.035,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    width: width * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.comment,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '9',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: width * 0.035,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
