class CVModel {
  String? id;
  String? userID;
  String? fullName;
  String? address;
  String? phone;
  String? email;
  List? skills;
  List? certificate;
  List? experience;

  CVModel({
    this.id,
    required this.userID,
    required this.fullName,
    required this.address,
    required this.phone,
    required this.email,
    required this.skills,
    required this.certificate,
    required this.experience,
  });

  CVModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userID = json['IDUser'];
    fullName = json['fullName'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    skills = json['skills'];
    certificate = json['certificate'];
    experience = json['experience'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userID': userID,
      'fullName': fullName,
      'address': address,
      'phone': phone,
      'email': email,
      'skills': skills,
      'certificate': certificate,
      'experience': experience,
    };
  }
}
