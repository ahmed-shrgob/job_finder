import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:job_finder/core/view%20model/authVM.dart';
import 'package:job_finder/core/view/screens/main_screen.dart';
import 'package:job_finder/core/view/widgets/button.dart';
import 'package:job_finder/core/view/widgets/text_form_widget.dart';

// ignore: must_be_immutable
class UserSignupScreen extends StatefulWidget {
  UserSignupScreen({super.key});
  static final _formKey = GlobalKey<FormState>();

  @override
  State<UserSignupScreen> createState() => _UserSignupScreenState();
}

class _UserSignupScreenState extends State<UserSignupScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  AuthVM auth = AuthVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: Text('انشاء حساب كباحث عن عمل'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Job \n Finder',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: width * 0.1, color: AppColor.mainColor),
              ),
              SizedBox(
                height: width * 0.1,
              ),
              Text(
                'تسجيل الدخول',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Form(
                  key: UserSignupScreen._formKey,
                  child: Column(
                    children: [
                      TextFormWidget(
                        controller: _emailController,
                        hintText: 'ادخل بريدك الالكتروني',
                        labelText: 'البريد الالكتروني',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'لايمكن ترك هذا الحقل فارغ';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormWidget(
                        controller: _nameController,
                        hintText: 'اكتب اسمك',
                        labelText: 'الاسم',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'لايمكن ترك هذا الحقل فارغ';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormWidget(
                        controller: _passwordController,
                        hintText: 'ادخل كلمة السر الخاصة فيك',
                        labelText: 'كلمة السر',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'لايمكن ترك هذا الحقل فارغ';
                          }
                          if (value.length < 6) {
                            return 'كلمة السر يجب ان تحتوي 6 عناصر على الاقل';
                          }
                          return null;
                        },
                        keyboardType: null,
                      ),
                      ButtonWidget(
                        onPressed: () async {
                          if (UserSignupScreen._formKey.currentState!.validate()) {
                            if (await auth.signup(
                                _emailController.text,
                                _passwordController.text,
                                _nameController.text)) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(),
                                  ));
                            }
                          }
                        },
                        color: AppColor.mainColor,
                        child: Text(
                          'إنشاء الحساب',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('او قم بالتسجيل عبر :'),
                      ButtonWidget(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.g_mobiledata,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Google',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                          color: Colors.red),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
