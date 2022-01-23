// To parse this JSON data, do
//
//     final getData = getDataFromJson(jsonString);

import 'dart:convert';

List<GetData> getDataFromJson(String str) =>
    List<GetData>.from(json.decode(str).map((x) => GetData.fromJson(x)));

String getDataToJson(List<GetData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetData {
  GetData({
    this.id,
    this.fullname,
    this.username,
    this.password,
    this.classId,
    this.accountType,
  });

  String id;
  String fullname;
  String username;
  String password;
  String classId;
  AccountType accountType;

  factory GetData.fromJson(Map<String, dynamic> json) => GetData(
        id: json["id"],
        fullname: json["fullname"],
        username: json["username"],
        password: json["password"],
        classId: json["classID"],
        accountType: accountTypeValues.map[json["accountType"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "username": username,
        "password": password,
        "classID": classId,
        "accountType": accountTypeValues.reverse[accountType],
      };
}

enum AccountType { EMPTY, USER, ADMIN }

final accountTypeValues = EnumValues({
  "admin": AccountType.ADMIN,
  "": AccountType.EMPTY,
  "user": AccountType.USER
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
