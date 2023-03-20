import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:diploma_web/src/features/assignments/ui/assignments_screen.dart';
import 'package:diploma_web/src/features/auth/sign_in/ui/authorization_screen.dart';
import 'package:diploma_web/src/features/courses/courses_detailed_lesson/ui/lesson.dart';
import 'package:diploma_web/src/features/courses/ui/courses_screen.dart';
import 'package:diploma_web/src/features/gradebook/gradebook_detailed/ui/gradebook_detailed.dart';
import 'package:diploma_web/src/features/navigation/primary_screen/primary_screen.dart';
import 'package:diploma_web/src/features/profile/my_resumes/my_resumes.dart';
import 'package:diploma_web/src/features/profile/ui/profile_screen.dart';
import 'package:diploma_web/src/features/saved/ui/saved_screen.dart';
import 'package:diploma_web/src/features/schedule/ui/schedule_screen.dart';
import 'package:diploma_web/src/features/settings/ui/settings_screen.dart';
import 'package:flutter/material.dart';

import '../../courses/courses_detailed/ui/courses_detailed.dart';
import '../../gradebook/ui/gradebook_screen.dart';
import '../../profile/create_resume/create_resume.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: AuthorizationScreen),
    AutoRoute(page: CreateResume),
    CustomRoute(
      page: PrimaryScreen,
      initial: true,
      durationInMilliseconds: 500,
      children: [
        AutoRoute(
          page: EmptyRouterPage,
          name: 'ProfileRouter',
          children: [
            AutoRoute(page: ProfileScreen, initial: true),
            AutoRoute(page: MyResumes )
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'CoursesRouter',
          children: [
            AutoRoute(page: CoursesScreen, initial: true),
            AutoRoute(page:  CoursesDetailed),
            AutoRoute(page: CoursesDetailedLesson),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'AssignmentsRouter',
          children: [
            AutoRoute(page: AssignmentsScreen, initial: true),
            AutoRoute(page:  CoursesDetailed),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'GradeBookRouter',
          children: [
            AutoRoute(page: GradeBookScreen, initial: true),
            AutoRoute(
              page: GradeBookDetailed,
            ),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'ScheduleRouter',
          children: [
            AutoRoute(page: ScheduleScreen, initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'SavedRouter',
          children: [
            AutoRoute(page: SavedScreen, initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'SettingsRouter',
          children: [
            AutoRoute(page: SettingsScreen, initial: true),
          ],
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter([
    super.navigatorKey,
  ]) {
    rootKey = super.navigatorKey;
  }

  static late final GlobalKey<NavigatorState> rootKey;
}
