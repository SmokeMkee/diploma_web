import 'package:diploma_web/student/src/features/courses/data/bloc/courses_bloc.dart';
import 'package:diploma_web/student/src/features/courses/data/repo/repo_courses.dart';
import 'package:diploma_web/student/src/features/profile/data/bloc/profile_bloc.dart';
import 'package:diploma_web/student/src/features/profile/data/repo/repo_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/auth_bloc.dart';
import '../../../auth/data/repo/repo.dart';

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
          )..add(FetchCoursesEvent()),
        ),

      ],
      child: child,
    );
  }
}
