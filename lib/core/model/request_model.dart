class Request {
  String? requestId;
  String? jobId;
  String? jobName;
  String? userId;
  String? userName;
  String? userRequestName;
  String? userRequestImage;

  Request(
      {this.requestId,
      this.jobId,
      this.jobName,
      this.userId,
      this.userName,
      this.userRequestName,
      this.userRequestImage
      });

  Request.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    jobId = json['jobId'];
    jobName = json['jobName'];
    userId = json['userId'];
    userName = json['userName'];
    userRequestName = json['UserRequestName'];
    userRequestImage = json['UserRequestImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestId'] = this.requestId;
    data['jobId'] = this.jobId;
    data['jobName'] = this.jobName;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['UserRequestName'] = this.userRequestName;
    data['UserRequestImage'] = this.userRequestImage;
    return data;
  }
}