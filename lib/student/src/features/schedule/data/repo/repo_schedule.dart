import 'dart:convert';

import 'package:diploma_web/student/src/features/profile/data/dto/profile_model.dart';

import '../../../../../../../api/api.dart';
import '../dto/dto_schedule.dart';


class RepoSchedule {
  RepoSchedule({required this.api});

  final Api api;

  Future<List<Schedule>> fetch(String day) async {
    final result = await api.dio.get(
        '/students/get-student-schedule-by-day-of-week',
        queryParameters: {'dayOfWeek': day});
    return scheduleFromJson(json.encode(result.data));
  }


}
