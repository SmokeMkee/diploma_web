import 'package:flutter/material.dart';

import '../app_router/app_router.dart';
import '../navigation.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AutoTabsScaffold(
        builder: (context, child, animation) => child,
        routes: const [
          ProfileRouter(
            children: [ProfileScreenRoute()],
          ),
          CoursesRouter(
            children: [CoursesScreenRoute()],
          ),
          AssignmentsRouter(
            children: [AssignmentsScreenRoute()],
          ),
          GradeBookRouter(
            children: [GradeBookScreenRoute()],
          ),
          ScheduleRouter(
            children: [ScheduleScreenRoute()],
          ),
          SavedRouter(
            children: [SavedScreenRoute()],
          ),
          SettingsRouter(
            children: [SettingsScreenRoute()],
          ),
        ],
        bottomNavigationBuilder: (context, tabsRouter) {
          return Navigation(
            current: tabsRouter.activeIndex,
            switchTo: tabsRouter.setActiveIndex,
          );
        },
      ),
    );
  }
}
