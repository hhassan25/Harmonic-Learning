// To parse this JSON data, do
//
//     final getUser = getUserFromJson(jsonString);

import 'dart:convert';

List<GetUser> getUserFromJson(String str) =>
    List<GetUser>.from(json.decode(str).map((x) => GetUser.fromJson(x)));

String getUserToJson(List<GetUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetUser {
  GetUser({
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

  factory GetUser.fromJson(Map<String, dynamic> json) => GetUser(
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
