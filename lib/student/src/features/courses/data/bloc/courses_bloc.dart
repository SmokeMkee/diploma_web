import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dto/courses.dart';
import '../repo/repo_courses.dart';

part 'courses_event.dart';

part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CoursesBloc({required this.repo}) : super(CoursesInitial()) {
    on<FetchCoursesEvent>(fetchData, transformer: droppable());
  }

  List<Courses> listCourses = [];

  Future<void> fetchData(
    FetchCoursesEvent event,
    Emitter<CoursesState> emit,
  ) async {
    try {
      emit(CoursesLoading());
      final response = await repo.fetch();
      listCourses.clear();
      listCourses.addAll(response);
      emit(CoursesData(listCourses: listCourses));
    } catch (e) {
      emit(CoursesError(message: 'something error'));
    }
  }

  final RepoCourses repo;
}
