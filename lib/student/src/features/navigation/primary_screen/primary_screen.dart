import 'package:diploma_web/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../app_router/app_router.dart';
import '../navigation.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: AutoTabsScaffold(
          backgroundColor: AppColors.white,
          builder: (context, child, animation) => Row(
            children: [
              const SizedBox(
                width: 250,
              ),
              Expanded(child: child)
            ],
          ),
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
              children: [
                GradeBookScreenRoute(),
              ],
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.startDocked,
          floatingActionButtonBuilder: (context, tabsRouter) {
            return Navigation(
              current: tabsRouter.activeIndex,
              switchTo: tabsRouter.setActiveIndex,
            );
          },
        ),
      ),
    );
  }
}
