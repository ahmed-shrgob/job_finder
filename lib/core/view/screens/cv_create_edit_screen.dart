import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/model/CV_model.dart';
import 'package:job_finder/core/view%20model/cv_VM.dart';
import 'package:job_finder/core/view/screens/cv_profile_screen.dart';
import 'package:job_finder/core/view/widgets/button.dart';
import 'package:job_finder/core/view/widgets/cv_add_button_widget.dart';
import 'package:job_finder/core/view/widgets/text_form_widget.dart';
import 'package:job_finder/core/view/widgets/title_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CVCreateEditScreen extends StatelessWidget {
  bool isEdit;
  String? cvId;
  String? fullName;
  String? address;
  String? email;
  String? phone;
  late List skills;
  late List certificate;
  late List experience;
  CVCreateEditScreen(
      {this.cvId,
      this.fullName,
      this.address,
      this.email,
      this.phone,
      required this.isEdit,
      required this.certificate,
      required this.experience,
      required this.skills});

  final _CVglobalKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController certificateController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  // CVVM cvVM = CVVM();

  @override
  Widget build(BuildContext context) {
    final cvVM = Provider.of<CVVM>(context);
    return Scaffold(
      appBar: AppBar(
        title: isEdit ? Text("تعديل CV") : Text("انشاء CV"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
            key: _CVglobalKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TitleWidget(
                    text: 'معلومات عامة',
                  ),
                  TextFormWidget(
                    hintText: 'ادخل اسمك الرباعي',
                    labelText: 'الاسم',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'لايمكن ترك هذا الحقل فارغ';
                      }
                      return null;
                    },
                    controller: isEdit
                        ? fullNameController =
                            TextEditingController(text: fullName)
                        : fullNameController,
                  ),
                  TextFormWidget(
                    hintText: "ادخل عنوانك",
                    labelText: "العنوان",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'لايمكن ترك هذا الحقل فارغ';
                      }
                      return null;
                    },
                    controller: isEdit
                        ? addressController =
                            TextEditingController(text: address)
                        : addressController,
                  ),
                  TextFormWidget(
                    hintText: "ادخل ايميلك الرسمي ",
                    labelText: "الايميل",
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return 'صيغة ايميل خاطئة';
                      }
                      return null;
                    },
                    controller: isEdit
                        ? emailController = TextEditingController(text: email)
                        : emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormWidget(
                    hintText: "ادخل رقم هاتفك",
                    labelText: "رقم الهاتف",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'لايمكن ترك هذا الحقل فارغ';
                      }
                      return null;
                    },
                    controller: isEdit
                        ? phoneController = TextEditingController(text: phone)
                        : phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleWidget(
                      text: 'الشهادات',
                    ),
                  ),
                  CVAddButtonWidget(
                    cvList: cvVM.cv.certificate!,
                    textFormWidget: Column(
                      children: [
                        TitleWidget(
                          text: "اضافة شهادة",
                        ),
                        TextFormWidget(
                          hintText: "اضف شهادة",
                          labelText: " شهادة",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'لايمكن ترك هذا الحقل فارغ';
                            }
                            return null;
                          },
                          controller: certificateController,
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (_CVglobalKey.currentState!.validate()) {
                        cvVM.cv.certificate!.add(certificateController.text);
                        certificateController.clear();
                        cvVM.update(cvVM.cv);
                        Navigator.pop(context);
                      }
                    }, isEdit: isEdit,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleWidget(
                      text: 'المهارات',
                    ),
                  ),
                  CVAddButtonWidget(
                    cvList: cvVM.cv.skills!,
                    textFormWidget: Column(
                      children: [
                        TitleWidget(
                          text: "اضافة مهارة",
                        ),
                        TextFormWidget(
                          hintText: "مثلاً العمل تحت الضغط : جيد جداً",
                          labelText: "مهارة",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'لايمكن ترك هذا الحقل فارغ';
                            }
                            return null;
                          },
                          controller: skillsController,
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (_CVglobalKey.currentState!.validate()) {
                        cvVM.cv.skills!.add(skillsController.text);
                        cvVM.update(cvVM.cv);
                        skillsController.clear();
                        Navigator.pop(context);
                      }
                    }, isEdit: isEdit,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleWidget(
                      text: 'الخبرات',
                    ),
                  ),
                  CVAddButtonWidget(
                    cvList: cvVM.cv.experience!,
                    textFormWidget: Column(
                      children: [
                        TitleWidget(
                          text: "اضافة خبرة",
                        ),
                        TextFormWidget(
                          hintText: "مثلاً اين عملت او تطوعت",
                          labelText: "خبرة جديدة",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'لايمكن ترك هذا الحقل فارغ';
                            }
                            return null;
                          },
                          controller: experienceController,
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (_CVglobalKey.currentState!.validate()) {
                        cvVM.cv.experience!.add(experienceController.text);
                        experienceController.clear();
                        cvVM.update(cvVM.cv);
                        Navigator.pop(context);
                      }
                    }, isEdit: isEdit,
                  ),
                  ButtonWidget(
                      onPressed: () {
                        if (_CVglobalKey.currentState!.validate()) {
                          if (isEdit) {
                            cvVM.editCV(
                                CVModel(
                                    userID: userId,
                                    fullName: fullNameController.text,
                                    address: addressController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    skills: cvVM.cv.skills,
                                    certificate: cvVM.cv.certificate,
                                    experience: cvVM.cv.experience),
                                cvId);
                            cvVM.update(cvVM.cv);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CVProfileScreen(),
                                ));
                          } else {
                            cvVM.createCV(CVModel(
                                userID: userId,
                                fullName: fullNameController.text,
                                address: addressController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                                skills: cvVM.cv.skills,
                                certificate: cvVM.cv.certificate,
                                experience: cvVM.cv.experience));
                            cvVM.update(cvVM.cv);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CVProfileScreen(),
                                ));
                          }
                        }
                      },
                      child: isEdit
                          ? Text('تعديل السيرة الذاتية')
                          : Text('إنشاء السيرة الذاتية'),
                      color: AppColor.mainColor)
                ],
              ),
            )),
      ),
    );
  }
}
