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
class CVCreateEditScreen extends StatefulWidget {
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

 static final _CVglobalKey = GlobalKey<FormState>();
TextEditingController fullNameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController skillsController = TextEditingController();

  TextEditingController certificateController = TextEditingController();

  TextEditingController experienceController = TextEditingController();

  @override
  State<CVCreateEditScreen> createState() => _CVCreateEditScreenState();
}

class _CVCreateEditScreenState extends State<CVCreateEditScreen> {
  
  // CVVM cvVM = CVVM();
  @override
  Widget build(BuildContext context) {
    final cvVM = Provider.of<CVVM>(context);
    return Scaffold(
      appBar: AppBar(
        title: widget.isEdit ? Text("تعديل CV") : Text("انشاء CV"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
            key: CVCreateEditScreen._CVglobalKey,
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
                    controller: widget.isEdit
                        ?widget. fullNameController =
                            TextEditingController(text: widget.fullName)
                        : widget. fullNameController,
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
                    controller: widget.isEdit
                        ? widget. addressController =
                            TextEditingController(text: widget.address)
                        :widget.  addressController,
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
                    controller: widget.isEdit
                        ? widget. emailController = TextEditingController(text: widget.email)
                        : widget. emailController,
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
                    controller: widget.isEdit
                        ? widget. phoneController = TextEditingController(text: widget.phone)
                        :widget.  phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleWidget(
                      text: 'الشهادات',
                    ),
                  ),
                  CVAddButtonWidget(
                    cvList: cvVM.certificate,
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
                          controller: widget. certificateController,
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (widget. certificateController.text.isNotEmpty) {
                        cvVM.certificate.add(widget. certificateController.text);
                        widget. certificateController.clear();
                        widget.phone=widget.phoneController.text;
                        widget.fullName=widget.fullNameController.text;
                        widget.email=widget.emailController.text;
                        widget.address=widget.addressController.text;
                        cvVM.update();
                        Navigator.pop(context);
                      }
                    },
                    isEdit: widget.isEdit,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleWidget(
                      text: 'المهارات',
                    ),
                  ),
                  CVAddButtonWidget(
                    cvList: cvVM.skills,
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
                          controller: widget. skillsController,
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (widget. skillsController.text.isNotEmpty) {
                        cvVM.skills.add(widget. skillsController.text);
                        widget.phone=widget.phoneController.text;
                        widget.fullName=widget.fullNameController.text;
                        widget.email=widget.emailController.text;
                        widget.address=widget.addressController.text;
                        cvVM.update();
                        widget. skillsController.clear();
                        Navigator.pop(context);
                      }
                    },
                    isEdit: widget.isEdit,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleWidget(
                      text: 'الخبرات',
                    ),
                  ),
                  CVAddButtonWidget(
                    cvList: cvVM.experience,
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
                          controller:widget.  experienceController,
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (widget. experienceController.text.isNotEmpty) {
                        cvVM.experience.add(widget. experienceController.text);
                        widget. experienceController.clear();
                         widget.phone=widget.phoneController.text;
                        widget.fullName=widget.fullNameController.text;
                        widget.email=widget.emailController.text;
                        widget.address=widget.addressController.text;
                        cvVM.update();
                        Navigator.pop(context);
                      }
                    },
                    isEdit: widget.isEdit,
                  ),
                  ButtonWidget(
                      onPressed: () {
                        if (CVCreateEditScreen._CVglobalKey.currentState!.validate()) {
                          if (widget.isEdit) {
                            cvVM.editCV(
                                CVModel(
                                    userID: userId,
                                    fullName: widget. fullNameController.text,
                                    address: widget. addressController.text,
                                    phone:widget.  phoneController.text,
                                    email: widget. emailController.text,
                                    skills: cvVM.skills,
                                    certificate: cvVM.certificate,
                                    experience: cvVM.experience),
                                widget.cvId);
                            Navigator.pop(context, true);
                          } else {
                            cvVM.createCV(CVModel(
                                userID: userId,
                                fullName: widget. fullNameController.text,
                                address: widget. addressController.text,
                                phone: widget. phoneController.text,
                                email:widget.  emailController.text,
                                skills: cvVM.skills,
                                certificate: cvVM.certificate,
                                experience: cvVM.experience));
                            Navigator.pop(context, true);
                          }
                        }
                      },
                      child: widget.isEdit
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
