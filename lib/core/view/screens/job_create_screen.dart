import 'package:flutter/material.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/model/job_model.dart';
import 'package:job_finder/core/view%20model/jobVM.dart';
import 'package:job_finder/core/view/widgets/button.dart';
import 'package:job_finder/core/view/widgets/cv_add_button_widget.dart';
import 'package:job_finder/core/view/widgets/text_form_widget.dart';
import 'package:job_finder/core/view/widgets/title_widget.dart';
import 'package:job_finder/helper/job_dropdown_providr.dart';
import 'package:provider/provider.dart';

class CreateJobScreen extends StatelessWidget {
  CreateJobScreen({super.key});
  final createJobKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _salaryController = TextEditingController();
  final _experienceController = TextEditingController();
  final _skillsController = TextEditingController();
  final _certificateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final jobVM = Provider.of<JobVM>(context);
    final dropdownProvidor = Provider.of<JobDropdownValueProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: Text('إنشاء وظيفة جديدة'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Form(
        key: createJobKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormWidget(
                    labelText: 'اسم الوظيفة',
                    hintText: 'مثلاً: مندوب مبيعات او مبرمج ...الخ',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'لايمكن ترك هذا الحقل فارغ';
                      }
                      return null;
                    },
                    controller: _nameController),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 4,
                  maxLength: 500,
                  decoration: InputDecoration(
                      labelText: 'نبذة تعريفية عن الوظيفة',
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
                Text(
                  'الموقع',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  height: 20,
                ),
                Text(
                  'نوع الدوام',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownButton(
                  borderRadius: BorderRadius.circular(10),
                  value: dropdownProvidor.workScheduleValue,
                  items: dropdownProvidor.workSchedule
                      .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                      .toList(),
                  onChanged: (newValue) {
                    dropdownProvidor.workScheduleValue = newValue!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'نوع الوظيفة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownButton(
                  borderRadius: BorderRadius.circular(10),
                  value: dropdownProvidor.jobTypeValue,
                  items: dropdownProvidor.jobType
                      .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                      .toList(),
                  onChanged: (newValue) {
                    dropdownProvidor.jobTypeValue = newValue!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormWidget(
                    labelText: 'الراتب',
                    hintText: 'اكتب الراتب مع تحديد العملة او اكتب "غير محدد"',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'لايمكن ترك هذا الحقل فارغ';
                      }
                      return null;
                    },
                    controller: _salaryController),
                SizedBox(
                  height: 20,
                ),
                TitleWidget(text: 'الخبرات المطلوبه'),
                CVAddButtonWidget(
                    cvList: jobVM.experience,
                    textFormWidget: TextFormWidget(
                        hintText: 'اضف خبرة',
                        labelText: 'اضف خبرة',
                        validator: (value) {
                          return null;
                        },
                        controller: _experienceController),
                    onPressed: () {
                      if (_experienceController.text.isNotEmpty) {
                        jobVM.experience.add(_experienceController.text);
                        jobVM.updet();
                        _experienceController.clear();
                        Navigator.pop(context);
                      }
                    },
                    isEdit: false),
                SizedBox(
                  height: 20,
                ),
                TitleWidget(text: 'المهارات المطلوبه'),
                CVAddButtonWidget(
                    cvList: jobVM.skills,
                    textFormWidget: TextFormWidget(
                        hintText: 'اضف مهارة',
                        labelText: 'اضف مهارة',
                        validator: (value) {
                          return null;
                        },
                        controller: _skillsController),
                    onPressed: () {
                      if (_skillsController.text.isNotEmpty) {
                        jobVM.skills.add(_skillsController.text);
                        jobVM.updet();
                        _skillsController.clear();
                        Navigator.pop(context);
                      }
                    },
                    isEdit: false),
                SizedBox(
                  height: 20,
                ),
                TitleWidget(text: 'الشهادات المطلوبه'),
                CVAddButtonWidget(
                    cvList: jobVM.certificate,
                    textFormWidget: TextFormWidget(
                        hintText: 'اضف شهادة',
                        labelText: 'اضف شهادة',
                        validator: (value) {
                          return null;
                        },
                        controller: _certificateController),
                    onPressed: () {
                      if (_certificateController.text.isNotEmpty) {
                        jobVM.certificate.add(_certificateController.text);
                        jobVM.updet();
                        _certificateController.clear();
                        Navigator.pop(context);
                      }
                    },
                    isEdit: false),
                ButtonWidget(
                    onPressed: () async {
                      if (createJobKey.currentState!.validate()) {
                        final jobModel= Job(
                            IDUser: userId,
                            name: _nameController.text,
                            location: dropdownProvidor.cityValue,
                            bio: _bioController.text,
                            workSchedule: dropdownProvidor.workScheduleValue,
                            type: dropdownProvidor.jobTypeValue,
                            salary: _salaryController.text,
                            experience: jobVM.experience,
                            skills: jobVM.skills,
                            certificate: jobVM.certificate);
                        if (await jobVM.createJob(jobModel)) {
                          jobVM.skills.clear();
                          jobVM.certificate.clear();
                          jobVM.experience.clear();
                          Navigator.pop(context,true);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("حدث خطأ ... تأكد من اتصالك بالانرنت")));
                        }
                      }
                    },
                    child: Text('نشر الوظيفة'),
                    color: AppColor.mainColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
