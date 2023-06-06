import 'dart:convert';

import 'package:diploma_web/student/src/features/profile/data/dto/profile_model.dart';
import 'package:diploma_web/student/src/features/schedule/ui/data/dto/dto_schedule.dart';

import '../../../../../../../api/api.dart';


class RepoSchedule {
  RepoSchedule({required this.api});

  final Api api;

  Future<List<Schedule>> fetch() async {
    final result = await api.dio.get(
      '/students/get-student-schedule',
    );
    return scheduleFromJson(jsonEncode(result.data));
  }


}
