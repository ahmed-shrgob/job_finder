import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:job_finder/core/view%20model/authVM.dart';
import 'package:job_finder/core/view/screens/main_screen.dart';
import 'package:job_finder/core/view/screens/singup_screen.dart';
import 'package:job_finder/core/view/widgets/button.dart';
import 'package:job_finder/core/view/widgets/text_form_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
 static final _formKey = GlobalKey<FormState>();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  AuthVM auth = AuthVM();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Job \n Finder',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: width * 0.1, color: AppColor.mainColor),
                ),
                SizedBox(
                  height: width * 0.1,
                ),
                Text(
                  'تسجيل الدخول',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Form(
                    key: LoginScreen._formKey,
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
                          controller: _passwordController,
                          hintText: 'ادخل كلمة السر الخاصة فيك',
                          labelText: 'كلمة السر',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'لايمكن ترك هذا الحقل فارغ';
                            }
                            return null;
                          },
                          keyboardType: null,
                        ),
                      
                        Container(
                          width: double.infinity,
                          alignment: Alignment.topLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'نسيت كلمة السر؟',
                                style: TextStyle(
                                    color: AppColor.mainColor,
                                    fontSize: width * 0.035),
                              )),
                        ),
                        ButtonWidget(
                          onPressed: () async {
                            if (LoginScreen._formKey.currentState!.validate()) {
                              if (await auth.login(_emailController.text,
                                  _passwordController.text)) {
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
                            'تسجيل الدخول',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ليس لديك حساب؟",
                              // style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupScreen(),
                                      ));
                                },
                                child: Text(
                                  'انشاء حساب جديد',
                                  style: TextStyle(
                                      color: AppColor.mainColor,
                                      fontSize: width * 0.037),
                                )),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
