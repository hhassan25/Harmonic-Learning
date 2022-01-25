// To parse this JSON data, do
//
//     final getProject = getProjectFromJson(jsonString);

import 'dart:convert';

List<GetProject> getProjectFromJson(String str) =>
    List<GetProject>.from(json.decode(str).map((x) => GetProject.fromJson(x)));

String getProjectToJson(List<GetProject> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetProject {
  GetProject({
    this.id,
    this.fileName,
    this.fileUrl,
    this.username,
    this.fullname,
    this.password,
    this.classId,
    this.accountType,
  });

  String id;
  String fileName;
  String fileUrl;
  String username;
  String fullname;
  String password;
  String classId;
  String accountType;

  factory GetProject.fromJson(Map<String, dynamic> json) => GetProject(
        id: json["id"],
        fileName: json["fileName"],
        fileUrl: json["fileUrl"],
        username: json["username"],
        fullname: json["fullname"],
        password: json["password"],
        classId: json["classID"],
        accountType: json["accountType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": fileName,
        "fileUrl": fileUrl,
        "username": username,
        "fullname": fullname,
        "password": password,
        "classID": classId,
        "accountType": accountType,
      };
}
