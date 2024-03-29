import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import 'package:flutter/material.dart';

import '../../assignments/ui/assignments_screen.dart';
import '../../auth/sign_in/ui/authorization_screen.dart';
import '../../courses/courses_detailed/ui/courses_detailed.dart';
import '../../courses/courses_detailed_lesson/ui/lesson.dart';
import '../../courses/ui/courses_screen.dart';
import '../../gradebook/gradebook_detailed/ui/gradebook_detailed.dart';
import '../../gradebook/ui/gradebook_screen.dart';
import '../../profile/create_resume/create_resume.dart';
import '../../profile/my_resumes/my_resumes.dart';
import '../../profile/ui/profile_screen.dart';
import '../../saved/ui/saved_screen.dart';
import '../../schedule/ui/schedule_screen.dart';
import '../../settings/ui/settings_screen.dart';
import '../primary_screen/primary_screen.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: AuthorizationScreen,
      initial: true,
    ),
    //AutoRoute(page: CreateResume),
    CustomRoute(
      page: PrimaryScreen,
      durationInMilliseconds: 500,
      children: [
        AutoRoute(
          page: EmptyRouterPage,
          name: 'ProfileRouter',
          children: [
            AutoRoute(page: ProfileScreen, initial: true),
            AutoRoute(page: MyResumes),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'CoursesRouter',
          children: [
            AutoRoute(page: CoursesScreen, initial: true),
            AutoRoute(page: CoursesDetailed),
            AutoRoute(page: CoursesDetailedLesson),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'AssignmentsRouter',
          children: [
            AutoRoute(page: AssignmentsScreen, initial: true),
            AutoRoute(page: CoursesDetailed),
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
