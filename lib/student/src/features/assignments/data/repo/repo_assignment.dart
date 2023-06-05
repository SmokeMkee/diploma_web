import 'dart:convert';


import '../../../../../../api/api.dart';
import '../dto/dto_assignments.dart';

class RepoAssignment {
  RepoAssignment({required this.api});

  final Api api;

  Future<List<Assignments>> fetch() async {
    final result = await api.dio.get('/students/get-student-all-assignments');
    print(1);
    return assignmentsListFromJson(json.encode(result.data));
  }
}
