import 'dart:io';

import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/core/model/user_model.dart';
import 'package:job_finder/core/view%20model/authVM.dart';
import 'package:job_finder/core/view/screens/main_screen.dart';
import 'package:job_finder/core/view/widgets/button.dart';
import 'package:job_finder/core/view/widgets/image_widget.dart';
import 'package:job_finder/core/view/widgets/text_form_widget.dart';
import 'package:job_finder/helper/company_dropdown_providr.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CompanySignupScreen extends StatefulWidget {
  CompanySignupScreen({super.key});
 static final _registerKey = GlobalKey<FormState>();

  @override
  State<CompanySignupScreen> createState() => _CompanySignupScreenState();
}

class _CompanySignupScreenState extends State<CompanySignupScreen> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  // final _locationController = TextEditingController();
  // final _categoreyController = TextEditingController();

  final _bioController = TextEditingController();

  final AuthVM authVM = AuthVM();

  File? image;

  @override
  Widget build(BuildContext context) {
    final dropdownProvidor = Provider.of<CompanyDropdownValueProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('انشاء حساب كشركة او مؤسسة'),
        centerTitle: true,
        backgroundColor: AppColor.appBarColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Form(
              key: CompanySignupScreen._registerKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ProfileWidget(image: image,),
                    TextFormWidget(
                        hintText: 'اسم الشركة او المؤسسة',
                        labelText: 'الأسم',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'لايمكن ترك هذا الحقل فارغ';
                          }
                          return null;
                        },
                        controller: _nameController),
                    TextFormWidget(
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'الايمل',
                        labelText: 'الايميل',
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return 'صيغة ايميل خاطئة';
                          }
                          return null;
                        },
                        controller: _emailController),
                    TextFormWidget(
                        hintText: 'كلمة المرور',
                        labelText: 'كلمة المرور',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'لايمكن ترك هذا الحقل فارغ';
                          }
                          if (value.length < 6) {
                            return 'كلمة السر يجب ان تحتوي 6 عناصر على الاقل';
                          }
                          return null;
                        },
                        controller: _passwordController),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'الموقع',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: dropdownProvidor.cityValue,
                      items: dropdownProvidor.ceties
                          .map<DropdownMenuItem<String>>(
                              (value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                          .toList(),
                      onChanged: (newValue) {
                        dropdownProvidor.cityValue = newValue!;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'عدد الموظفين',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: dropdownProvidor.employeeCountValue,
                      items: dropdownProvidor.employeeCountList
                          .map<DropdownMenuItem<String>>(
                              (value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                          .toList(),
                      onChanged: (newValue) {
                        dropdownProvidor.employeeCountValue = newValue!;
                      },
                    ),
                    Text(
                      'مجال الشركة',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: dropdownProvidor.categoreyValue,
                      items: dropdownProvidor.categories
                          .map<DropdownMenuItem<String>>(
                              (value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                          .toList(),
                      onChanged: (newValue) {
                        dropdownProvidor.categoreyValue = newValue!;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // TextFormWidget(
                    //     hintText: 'مثلا تجارة او شركة برمجيات ...الخ',
                    //     labelText: 'مجال الشركة',
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'لايمكن ترك هذا الحقل فارغ';
                    //       }
                    //       return null;
                    //     },
                    //     controller: _categoreyController),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 4,
                      maxLength: 500,
                      decoration: InputDecoration(
                          labelText: 'نبذة تعريفية',
                          helperText: 'نبذة تعريفية لا تتجاوز 500 حرف',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'لايمكن ترك هذا الحقل فارغ';
                        }
                        return null;
                      },
                      controller: _bioController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonWidget(
                        onPressed: () async {
                          print(image);
                          if (dropdownProvidor.categoreyValue == "غير محدد") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'يجب تحديد مجال العمل وعدم تركه غير محدد')));
                          } else if (CompanySignupScreen._registerKey.currentState!.validate()) {
                            await authVM.companySignup(User(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              location: dropdownProvidor.cityValue,
                              employeeCount:
                                  dropdownProvidor.employeeCountValue,
                              categorey: dropdownProvidor.categoreyValue,
                              bio: _bioController.text,
                            ))
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainScreen(),
                                    ))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('حدث خطأ')));
                          }
                        },
                        child: Text('انشاء شركة'),
                        color: AppColor.primaryColor)
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
