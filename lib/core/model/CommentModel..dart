class CommentModel {
  String? id;
  String? body;
  String? blogID;
  String? Date;
  String? name;
  String? commenterID;
  String? IdUser;
  // int? _v;
  CommentModel(
      {this.id,
      this.body,
      this.blogID,
      this.Date,
      this.name,
      this.commenterID});
  CommentModel.formJosn(Map<String, dynamic> josn) {
    id = josn['_id'];
    body = josn['body'];
    blogID = josn['blogID'];
    name = josn["commenterID"]["name"];
    IdUser = josn["commenterID"]["_id"];
    Date = josn["date"]["date"];
  }
  Map<String, dynamic> toJosn() {
    return {
      "name": name,
      "body": body,
      "blogID": blogID,
      "commenterID": commenterID,
    };
  }
}
