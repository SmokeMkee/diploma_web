// To parse this JSON data, do
//
//     final courses = coursesFromJson(jsonString);

import 'dart:convert';

List<Courses> coursesFromJson(String str) => List<Courses>.from(json.decode(str).map((x) => Courses.fromJson(x)));

String coursesToJson(List<Courses> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Courses {
  final int? courseId;
  final String? courseName;
  final String? email;
  final int? groupId;
  final int? userId;

  Courses({
    this.courseId,
    this.courseName,
    this.email,
    this.groupId,
    this.userId,
  });

  Courses copyWith({
    int? courseId,
    String? courseName,
    String? email,
    int? groupId,
    int? userId,
  }) =>
      Courses(
        courseId: courseId ?? this.courseId,
        courseName: courseName ?? this.courseName,
        email: email ?? this.email,
        groupId: groupId ?? this.groupId,
        userId: userId ?? this.userId,
      );

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
    courseId: json["courseId"],
    courseName: json["courseName"],
    email: json["email"],
    groupId: json["groupId"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "courseId": courseId,
    "courseName": courseName,
    "email": email,
    "groupId": groupId,
    "userId": userId,
  };
}
