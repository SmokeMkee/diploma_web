import 'dart:convert';

import '../../../../../../api/api.dart';
import '../dto/courses.dart';

class RepoCourses {
  RepoCourses({required this.api});

  final Api api;

  Future<List<Courses>> fetch() async {
    final result = await api.dio.get('/students/get-student-courses',queryParameters: {
      "courseId" : 1
    });
    List<Courses> listCourse = coursesFromJson(json.encode(result.data));
    return listCourse;
  }

}
