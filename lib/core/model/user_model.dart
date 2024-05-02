class User {
  String? id;
  String? email;
  String? password;
  String? name;
  String? type;
  // String? image;
  String? location;
  String? categorey;
  String? gender;
  String? bio;
  String? employeeCount;
  String? companyCreateAt;
  User(
      {this.id,
      this.email,
      this.password,
      this.name,
      this.type,
      // this.image,
      this.location,
      this.categorey,
      this.gender,
      this.bio,
      this.employeeCount,
      this.companyCreateAt});
  User.fromJson(Map<String, dynamic> Json) {
    id = Json["_id"];
    email = Json["email"];
    password = Json["password"];
    name = Json["name"];
    type = Json["type"];
    // image = Json["image"];
    location = Json["location"];
    categorey = Json["categorey"];
    gender = Json["gender"];
    bio = Json["bio"];
    employeeCount = Json["employeeCount"];
    companyCreateAt = Json["companyCreateAt"];
  }
  Map<String, dynamic> toJson(String userType) {
    return {
      "email": email,
      "password": password,
      "name": name,
      "type": userType,
      // "image": image,
      "location": location,
      "categorey": categorey,
      "gender": gender,
      "bio": bio,
      "employeeCount": employeeCount,
      "companyCreateAt": companyCreateAt,
    };
  }
}
