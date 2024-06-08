class CommuntyType {
  String? id;
  String? name;
  // String? bio;
  // String? Categorey;
  CommuntyType({
    required this.id,
    required this.name,
    // required this.bio,
    // required this.Categorey,
  });
  CommuntyType.formJosn(Map<String, dynamic> josn) {
    id = josn["_id"];
    name = josn["name"];
    // bio = josn["bio"];
    // Categorey = josn["Categorey"];
  }
}
