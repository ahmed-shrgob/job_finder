class LikeModel {
  String? id;
  String? IDUser;
  String? IDblog;
  bool? liked;
  LikeModel({
    this.IDUser,
    this.IDblog,
    this.id,
    this.liked,
  });
  LikeModel.formJosn(Map<String, dynamic> josn) {
    id = josn['_id'];
    IDUser = josn["IDUser"];
    IDblog = josn["IDblog"];
    liked = josn['liked'];
  }

  Map<String, dynamic> toJosn() {
    return {
      "userId": IDUser,
      "postId": IDblog,
    };
  }
}
