import 'dart:convert';

import '../../../../../../../api/api.dart';
import '../dto/unit.dart';

class RepoCoursesUnits {
  RepoCoursesUnits({required this.api});

  final Api api;

  Future<List<Unit>> fetch(int id) async {
    final result =
        await api.dio.get('/students/get-courses-units', queryParameters: {
      "courseId": id,
    });
    List<Unit> listUnits = unitFromJson(json.encode(result.data));
    return listUnits;
  }


}
