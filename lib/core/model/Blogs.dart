class BlogsModel {
  String? id;
  String? title;
  String? body;
  String? type;
  String? Categorey;
  String? author;
  String? createdAt;
  String? userImage;
  String? userName;
  int? likes;
  bool? isliked;
  BlogsModel(
      {this.id,
      this.title,
      this.body,
      this.type,
      this.Categorey,
      this.author,
      this.isliked,
      this.likes,
      this.createdAt,
      this.userImage,
      this.userName});
  BlogsModel.formjosn(Map<String, dynamic> josn) {
    id = josn["_id"];
    title = josn["title"];
    body = josn["body"];
    type = josn["type"];
    Categorey = josn['Categorey'];
    author = josn["author"];
    createdAt = josn["createdAt"];
    userImage = josn["userImage"];
    userName = josn["userName"];
    likes = josn["likes"];
    isliked = josn["isliked"];
  }
  Map<String, dynamic> toJosn() {
    return {
      // "title": title,
      "body": body,
      "type": type,
      "Categorey": Categorey,
      "author": author,
    };
  }
}
