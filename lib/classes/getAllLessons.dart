// To parse this JSON data, do
//
//     final getLesson = getLessonFromJson(jsonString);

import 'dart:convert';

List<GetLesson> getLessonFromJson(String str) =>
    List<GetLesson>.from(json.decode(str).map((x) => GetLesson.fromJson(x)));

String getLessonToJson(List<GetLesson> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetLesson {
  GetLesson({
    this.id,
    this.urll,
    this.courseType,
    this.courseName,
    this.courseImage,
    this.classId,
    this.courseId,
    this.isDemo,
    this.langCode,
  });

  String id;
  String urll;
  CourseType courseType;
  String courseName;
  String courseImage;
  String classId;
  String courseId;
  String isDemo;
  LangCode langCode;

  factory GetLesson.fromJson(Map<String, dynamic> json) => GetLesson(
        id: json["ID"],
        urll: json["urll"],
        courseType: courseTypeValues.map[json["courseType"]],
        courseName: json["courseName"],
        courseImage: json["courseImage"],
        classId: json["classID"],
        courseId: json["courseID"],
        isDemo: json["isDemo"],
        langCode: langCodeValues.map[json["langCode"]],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "urll": urll,
        "courseType": courseTypeValues.reverse[courseType],
        "courseName": courseName,
        "courseImage": courseImage,
        "classID": classId,
        "courseID": courseId,
        "isDemo": isDemo,
        "langCode": langCodeValues.reverse[langCode],
      };
}

enum CourseType { COURSE_TYPE, EMPTY, PDF }

final courseTypeValues = EnumValues({
  "courseType": CourseType.COURSE_TYPE,
  "": CourseType.EMPTY,
  "pdf": CourseType.PDF
});

enum LangCode { LANGUAGE, EN, AR }

final langCodeValues = EnumValues(
    {"ar": LangCode.AR, "en": LangCode.EN, "language": LangCode.LANGUAGE});

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
