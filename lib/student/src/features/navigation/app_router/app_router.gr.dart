// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthorizationScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const AuthorizationScreen(),
      );
    },
    PrimaryScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const PrimaryScreen(),
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    CoursesRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    AssignmentsRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    GradeBookRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    ScheduleRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    SettingsRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    MyResumesRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const MyResumes(),
      );
    },
    CoursesScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const CoursesScreen(),
      );
    },
    CoursesDetailedRoute.name: (routeData) {
      final args = routeData.argsAs<CoursesDetailedRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: CoursesDetailed(
          key: args.key,
          courseId: args.courseId,
          courseName: args.courseName,
        ),
      );
    },
    CoursesDetailedLessonRoute.name: (routeData) {
      final args = routeData.argsAs<CoursesDetailedLessonRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: CoursesDetailedLesson(
          key: args.key,
          unitSectionName: args.unitSectionName,
          courseName: args.courseName,
          unitId: args.unitId,
          courseId: args.courseId,
        ),
      );
    },
    AssignmentsScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const AssignmentsScreen(),
      );
    },
    GradeBookScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const GradeBookScreen(),
      );
    },
    GradeBookDetailedRoute.name: (routeData) {
      final args = routeData.argsAs<GradeBookDetailedRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: GradeBookDetailed(
          key: args.key,
          courseId: args.courseId,
          teacherName: args.teacherName,
          courseName: args.courseName,
        ),
      );
    },
    ScheduleScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const ScheduleScreen(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          AuthorizationScreenRoute.name,
          path: '/',
        ),
        RouteConfig(
          PrimaryScreenRoute.name,
          path: '/primary-screen',
          children: [
            RouteConfig(
              ProfileRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  ProfileScreenRoute.name,
                  path: '',
                  parent: ProfileRouter.name,
                ),
                RouteConfig(
                  MyResumesRoute.name,
                  path: 'my-resumes',
                  parent: ProfileRouter.name,
                ),
              ],
            ),
            RouteConfig(
              CoursesRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  CoursesScreenRoute.name,
                  path: '',
                  parent: CoursesRouter.name,
                ),
                RouteConfig(
                  CoursesDetailedRoute.name,
                  path: 'courses-detailed',
                  parent: CoursesRouter.name,
                ),
                RouteConfig(
                  CoursesDetailedLessonRoute.name,
                  path: 'courses-detailed-lesson',
                  parent: CoursesRouter.name,
                ),
              ],
            ),
            RouteConfig(
              AssignmentsRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  AssignmentsScreenRoute.name,
                  path: '',
                  parent: AssignmentsRouter.name,
                ),
                RouteConfig(
                  CoursesDetailedRoute.name,
                  path: 'courses-detailed',
                  parent: AssignmentsRouter.name,
                ),
              ],
            ),
            RouteConfig(
              GradeBookRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  GradeBookScreenRoute.name,
                  path: '',
                  parent: GradeBookRouter.name,
                ),
                RouteConfig(
                  GradeBookDetailedRoute.name,
                  path: 'grade-book-detailed',
                  parent: GradeBookRouter.name,
                ),
              ],
            ),
            RouteConfig(
              ScheduleRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  ScheduleScreenRoute.name,
                  path: '',
                  parent: ScheduleRouter.name,
                )
              ],
            ),
            RouteConfig(
              SettingsRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  SettingsScreenRoute.name,
                  path: '',
                  parent: SettingsRouter.name,
                )
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [AuthorizationScreen]
class AuthorizationScreenRoute extends PageRouteInfo<void> {
  const AuthorizationScreenRoute()
      : super(
          AuthorizationScreenRoute.name,
          path: '/',
        );

  static const String name = 'AuthorizationScreenRoute';
}

/// generated route for
/// [PrimaryScreen]
class PrimaryScreenRoute extends PageRouteInfo<void> {
  const PrimaryScreenRoute({List<PageRouteInfo>? children})
      : super(
          PrimaryScreenRoute.name,
          path: '/primary-screen',
          initialChildren: children,
        );

  static const String name = 'PrimaryScreenRoute';
}

/// generated route for
/// [EmptyRouterPage]
class ProfileRouter extends PageRouteInfo<void> {
  const ProfileRouter({List<PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [EmptyRouterPage]
class CoursesRouter extends PageRouteInfo<void> {
  const CoursesRouter({List<PageRouteInfo>? children})
      : super(
          CoursesRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'CoursesRouter';
}

/// generated route for
/// [EmptyRouterPage]
class AssignmentsRouter extends PageRouteInfo<void> {
  const AssignmentsRouter({List<PageRouteInfo>? children})
      : super(
          AssignmentsRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'AssignmentsRouter';
}

/// generated route for
/// [EmptyRouterPage]
class GradeBookRouter extends PageRouteInfo<void> {
  const GradeBookRouter({List<PageRouteInfo>? children})
      : super(
          GradeBookRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'GradeBookRouter';
}

/// generated route for
/// [EmptyRouterPage]
class ScheduleRouter extends PageRouteInfo<void> {
  const ScheduleRouter({List<PageRouteInfo>? children})
      : super(
          ScheduleRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'ScheduleRouter';
}

/// generated route for
/// [EmptyRouterPage]
class SettingsRouter extends PageRouteInfo<void> {
  const SettingsRouter({List<PageRouteInfo>? children})
      : super(
          SettingsRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [ProfileScreen]
class ProfileScreenRoute extends PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: '',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [MyResumes]
class MyResumesRoute extends PageRouteInfo<void> {
  const MyResumesRoute()
      : super(
          MyResumesRoute.name,
          path: 'my-resumes',
        );

  static const String name = 'MyResumesRoute';
}

/// generated route for
/// [CoursesScreen]
class CoursesScreenRoute extends PageRouteInfo<void> {
  const CoursesScreenRoute()
      : super(
          CoursesScreenRoute.name,
          path: '',
        );

  static const String name = 'CoursesScreenRoute';
}

/// generated route for
/// [CoursesDetailed]
class CoursesDetailedRoute extends PageRouteInfo<CoursesDetailedRouteArgs> {
  CoursesDetailedRoute({
    Key? key,
    required int courseId,
    required String courseName,
  }) : super(
          CoursesDetailedRoute.name,
          path: 'courses-detailed',
          args: CoursesDetailedRouteArgs(
            key: key,
            courseId: courseId,
            courseName: courseName,
          ),
        );

  static const String name = 'CoursesDetailedRoute';
}

class CoursesDetailedRouteArgs {
  const CoursesDetailedRouteArgs({
    this.key,
    required this.courseId,
    required this.courseName,
  });

  final Key? key;

  final int courseId;

  final String courseName;

  @override
  String toString() {
    return 'CoursesDetailedRouteArgs{key: $key, courseId: $courseId, courseName: $courseName}';
  }
}

/// generated route for
/// [CoursesDetailedLesson]
class CoursesDetailedLessonRoute
    extends PageRouteInfo<CoursesDetailedLessonRouteArgs> {
  CoursesDetailedLessonRoute({
    Key? key,
    required String unitSectionName,
    required String courseName,
    required int unitId,
    required int courseId,
  }) : super(
          CoursesDetailedLessonRoute.name,
          path: 'courses-detailed-lesson',
          args: CoursesDetailedLessonRouteArgs(
            key: key,
            unitSectionName: unitSectionName,
            courseName: courseName,
            unitId: unitId,
            courseId: courseId,
          ),
        );

  static const String name = 'CoursesDetailedLessonRoute';
}

class CoursesDetailedLessonRouteArgs {
  const CoursesDetailedLessonRouteArgs({
    this.key,
    required this.unitSectionName,
    required this.courseName,
    required this.unitId,
    required this.courseId,
  });

  final Key? key;

  final String unitSectionName;

  final String courseName;

  final int unitId;

  final int courseId;

  @override
  String toString() {
    return 'CoursesDetailedLessonRouteArgs{key: $key, unitSectionName: $unitSectionName, courseName: $courseName, unitId: $unitId, courseId: $courseId}';
  }
}

/// generated route for
/// [AssignmentsScreen]
class AssignmentsScreenRoute extends PageRouteInfo<void> {
  const AssignmentsScreenRoute()
      : super(
          AssignmentsScreenRoute.name,
          path: '',
        );

  static const String name = 'AssignmentsScreenRoute';
}

/// generated route for
/// [GradeBookScreen]
class GradeBookScreenRoute extends PageRouteInfo<void> {
  const GradeBookScreenRoute()
      : super(
          GradeBookScreenRoute.name,
          path: '',
        );

  static const String name = 'GradeBookScreenRoute';
}

/// generated route for
/// [GradeBookDetailed]
class GradeBookDetailedRoute extends PageRouteInfo<GradeBookDetailedRouteArgs> {
  GradeBookDetailedRoute({
    Key? key,
    required int courseId,
    required String teacherName,
    required String courseName,
  }) : super(
          GradeBookDetailedRoute.name,
          path: 'grade-book-detailed',
          args: GradeBookDetailedRouteArgs(
            key: key,
            courseId: courseId,
            teacherName: teacherName,
            courseName: courseName,
          ),
        );

  static const String name = 'GradeBookDetailedRoute';
}

class GradeBookDetailedRouteArgs {
  const GradeBookDetailedRouteArgs({
    this.key,
    required this.courseId,
    required this.teacherName,
    required this.courseName,
  });

  final Key? key;

  final int courseId;

  final String teacherName;

  final String courseName;

  @override
  String toString() {
    return 'GradeBookDetailedRouteArgs{key: $key, courseId: $courseId, teacherName: $teacherName, courseName: $courseName}';
  }
}

/// generated route for
/// [ScheduleScreen]
class ScheduleScreenRoute extends PageRouteInfo<void> {
  const ScheduleScreenRoute()
      : super(
          ScheduleScreenRoute.name,
          path: '',
        );

  static const String name = 'ScheduleScreenRoute';
}

/// generated route for
/// [SettingsScreen]
class SettingsScreenRoute extends PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: '',
        );

  static const String name = 'SettingsScreenRoute';
}
