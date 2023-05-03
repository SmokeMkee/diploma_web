import 'package:diploma_web/student/src/features/courses/data/repo/repo_courses.dart';
import 'package:diploma_web/student/src/features/localization/i_locale_repo.dart';
import 'package:diploma_web/student/src/features/profile/data/repo/repo_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../api/api.dart';
import '../../../auth/data/repo/repo.dart';
import '../../../localization/locale_repo.dart';

class ReposProvider extends StatelessWidget {
  const ReposProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api(),
        ),
        RepositoryProvider<ILocaleRepo>(
          create: (context) => LocaleRepo(),
        ),
        Provider(
          create: (context) => RepoAuth(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoCourses(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoProfile(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),

      ],
      child: child,
    );
  }
}
