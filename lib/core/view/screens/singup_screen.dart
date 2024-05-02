import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/core/view/screens/company_signup_screen.dart';
import 'package:job_finder/core/view/screens/user_signup_screen.dart';
import 'package:job_finder/core/view/widgets/button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonWidget(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserSignupScreen(),
                  )),
              child: Text('انشاء حساب كباحث عن عمل'),
              color: AppColor.mainColor),
          ButtonWidget(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanySignupScreen(),
                  )),
              child: Text('انشاء حساب كشركة او مؤسسة'),
              color: AppColor.mainColor)
        ],
      ),
    );
  }
}
