import 'package:diploma_web/student/src/features/courses/courses_detailed/data/bloc/courses_detailed_bloc.dart';
import 'package:diploma_web/student/src/features/courses/data/bloc/courses_bloc.dart';
import 'package:diploma_web/student/src/features/courses/data/repo/repo_courses.dart';
import 'package:diploma_web/student/src/features/gradebook/gradebook_detailed/data/bloc/gradebook_detailed_bloc.dart';
import 'package:diploma_web/student/src/features/gradebook/gradebook_detailed/data/repo/repo_gradebook_detailed.dart';
import 'package:diploma_web/student/src/features/profile/data/bloc/profile_bloc.dart';
import 'package:diploma_web/student/src/features/profile/data/repo/repo_profile.dart';
import 'package:diploma_web/student/src/features/schedule/ui/data/bloc/schedule_bloc.dart';
import 'package:diploma_web/student/src/features/schedule/ui/data/repo/repo_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assignments/data/bloc/assignments_bloc.dart';
import '../../../assignments/data/repo/repo_assignment.dart';
import '../../../auth/data/auth_bloc.dart';
import '../../../auth/data/repo/repo.dart';
import '../../../courses/courses_detailed/data/repo/repo_courses.dart';
import '../../../courses/courses_detailed_lesson/data/bloc/unit_material_bloc.dart';
import '../../../courses/courses_detailed_lesson/data/bloc_material/section_material_bloc.dart';
import '../../../courses/courses_detailed_lesson/data/repo/repo_unit_material.dart';

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(
            repo: RepositoryProvider.of<RepoProfile>(context),
          )..add(
              FetchInfoProfile(),
            ),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            repo: RepositoryProvider.of<RepoAuth>(context),
          ),
        ),
        BlocProvider<CoursesBloc>(
          create: (context) => CoursesBloc(
            repo: RepositoryProvider.of<RepoCourses>(context),
          ),
        ),
        BlocProvider<CoursesDetailedBloc>(
          create: (context) => CoursesDetailedBloc(
            repo: RepositoryProvider.of<RepoCoursesUnits>(context),
          ),
        ),
        BlocProvider<AssignmentsBloc>(
          create: (context) => AssignmentsBloc(
            repo: RepositoryProvider.of<RepoAssignment>(context),
          )..add(FetchAssignmentsEvent()),
        ),
        BlocProvider<GradebookDetailedBloc>(
          create: (context) => GradebookDetailedBloc(
            repo: RepositoryProvider.of<RepoGradeBookDetailed>(context),
          ),
        ),
        BlocProvider<SectionMaterialBloc>(
          create: (context) => SectionMaterialBloc(
            repo: RepositoryProvider.of<RepoUnitMaterial>(context),
          ),
        ),
        BlocProvider<ScheduleBloc>(
          create: (context) => ScheduleBloc(
            repo: RepositoryProvider.of<RepoSchedule>(context),
          ),
        ),
        BlocProvider<UnitMaterialBloc>(
          create: (context) => UnitMaterialBloc(
            repo: RepositoryProvider.of<RepoUnitMaterial>(context),
          ),
        ),
      ],
      child: child,
    );
  }
}
