import 'dart:convert';

List<Unit> unitFromJson(String str) =>
    List<Unit>.from(json.decode(str).map((x) => Unit.fromJson(x)));

String unitToJson(List<Unit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Unit {
  final int? id;
  final String? unitName;
  final int? courseId;
  final int? userId;

  Unit({
    this.id,
    this.unitName,
    this.courseId,
    this.userId,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        unitName: json["unitName"],
        courseId: json["courseId"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unitName": unitName,
        "courseId": courseId,
        "userId": userId,
      };
}
