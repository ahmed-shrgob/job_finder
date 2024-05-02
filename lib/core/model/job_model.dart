class Job {
  String? id;
  String? IDUser;
  String? name;
  String? location;
  String? bio;
  String? workSchedule;
  String? type;
  String? salary;
  // String? education;
  String? createdAt;
  List? experience;
  List? skills;
  List? certificate;
  Job(
      {this.id,
      required this.IDUser,
      required this.name,
      required this.location,
      required this.bio,
      required this.workSchedule,
      required this.type,
      required this.salary,
      // this.education,
      this.createdAt,
      required this.experience,
      required this.skills,
      required this.certificate});
  Job.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    IDUser = json["IDUser"];
    name = json["name"];
    location = json["location"];
    bio = json["bio"];
    workSchedule = json["workSchedule"];
    type = json["type"];
    salary = json["salary"];
    // education = json["education"];
    createdAt = json["createdAt"];
    experience = json["experience"];
    skills = json["skills"];
    certificate = json["certificate"];
  }

  Map<String, dynamic> toJson() {
    return {
      // "_id": id,
      "IDUser":IDUser,
      "name": name,
      "location": location,
      "bio": bio,
      "workSchedule": workSchedule,
      "type": type,
      "salary": salary,
      // "education": education,
      // "createdAt": createdAt,
      "experience": experience,
      "skills": skills,
      "certificate": certificate,
    };
  }
}
