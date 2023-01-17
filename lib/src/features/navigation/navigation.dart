import 'package:diploma_web/constants/app_styles.dart';
import 'package:diploma_web/src/features/assignments/ui/assignments_screen.dart';
import 'package:diploma_web/src/features/courses/ui/courses_screen.dart';
import 'package:diploma_web/src/features/gradebook/ui/gradebook_screen.dart';
import 'package:diploma_web/src/features/navigation/widgets/log_out_widget.dart';
import 'package:diploma_web/src/features/profile/ui/profile_screen.dart';
import 'package:diploma_web/src/features/saved/ui/saved_screen.dart';
import 'package:diploma_web/src/features/schedule/ui/schedule_screen.dart';
import 'package:diploma_web/src/features/settings/ui/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../localization/generated/l10n.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  List<Widget> screens = const [
    ProfileScreen(),
    CoursesScreen(),
    AssignmentsScreen(),
    GradeBookScreen(),
    ScheduleScreen(),
    SavedScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              elevation: 2,
              backgroundColor: AppColors.background,
              onTap: (int index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.svg.courses,
                    color: selectedIndex == 0 ? AppColors.gray900 : AppColors.gray600,
                  ),
                  label: S.of(context).courses,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.svg.assignments,
                    color: selectedIndex == 0 ? AppColors.gray900 : AppColors.gray600,
                  ),
                  label: S.of(context).assignments,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.svg.gradeBook,
                    color: selectedIndex == 0 ? AppColors.gray900 : AppColors.gray600,
                  ),
                  label: S.of(context).gradeBook,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.svg.schedule,
                    color: selectedIndex == 0 ? AppColors.gray900 : AppColors.gray600,
                  ),
                  label: S.of(context).schedule,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.svg.saved,
                    color: selectedIndex == 0 ? AppColors.gray900 : AppColors.gray600,
                  ),
                  label: S.of(context).saved,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.svg.settings,
                    color: selectedIndex == 0 ? AppColors.gray900 : AppColors.gray600,
                  ),
                  label: S.of(context).settings,
                ),
              ],
              currentIndex: selectedIndex,
            )
          : null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              trailing: const LogOutWidget(),
              elevation: 3,
              backgroundColor: AppColors.background,
              labelType: NavigationRailLabelType.none,
              extended: true,
              destinations: [
                NavigationRailDestination(
                  icon: const CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                      'https://thumbs.dreamstime.com/b/businessman-icon-image-male-'
                      'avatar-profile-vector-glasses-beard-hairstyle-179728610.jpg',
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  label: Row(
                    children: [
                      Text(
                        'Mary J.',
                        style: AppStyles.s17w500.copyWith(
                          color: selectedIndex == 0 ? AppColors.gray900 : AppColors.gray600,
                          fontWeight: selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      SvgPicture.asset(AppAssets.svg.arrowRight2)
                    ],
                  ),
                ),
                NavigationRailDestination(
                  icon: SvgPicture.asset(
                    selectedIndex == 1 ? AppAssets.svg.coursesBold : AppAssets.svg.courses,
                    color: selectedIndex == 1 ? AppColors.gray900 : AppColors.gray600,
                  ),
                  label: Text(
                    S.of(context).courses,
                    style: AppStyles.s15w500.copyWith(
                      color: selectedIndex == 1 ? AppColors.gray900 : AppColors.gray600,
                      fontWeight: selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                NavigationRailDestination(
                  icon: SvgPicture.asset(
                    selectedIndex == 2 ? AppAssets.svg.assignmentsBold : AppAssets.svg.assignments,
                    color: selectedIndex == 2 ? AppColors.gray900 : AppColors.gray600,
                  ),
                  label: Text(
                    S.of(context).assignments,
                    style: AppStyles.s15w500.copyWith(
                      color: selectedIndex == 2 ? AppColors.gray900 : AppColors.gray600,
                      fontWeight: selectedIndex == 2 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                NavigationRailDestination(
                  icon: SvgPicture.asset(
                    selectedIndex == 3 ? AppAssets.svg.gradeBookBold : AppAssets.svg.gradeBook,
                    color: selectedIndex == 3 ? AppColors.gray900 : AppColors.gray600,
                  ),
                  label: Text(
                    S.of(context).gradeBook,
                    style: AppStyles.s15w500.copyWith(
                      color: selectedIndex == 3 ? AppColors.gray900 : AppColors.gray600,
                      fontWeight: selectedIndex == 3 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                NavigationRailDestination(
                  icon: SvgPicture.asset(
                    selectedIndex == 4 ? AppAssets.svg.scheduleBold : AppAssets.svg.schedule,
                    color: selectedIndex == 4 ? AppColors.gray900 : AppColors.gray600,
                  ),
                  label: Text(
                    S.of(context).schedule,
                    style: AppStyles.s15w500.copyWith(
                      color: selectedIndex == 4 ? AppColors.gray900 : AppColors.gray600,
                      fontWeight: selectedIndex == 4 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                NavigationRailDestination(
                  icon: SvgPicture.asset(
                    selectedIndex == 5 ? AppAssets.svg.savedBold : AppAssets.svg.saved,
                    color: selectedIndex == 5 ? AppColors.gray900 : AppColors.gray600,
                  ),
                  label: Text(
                    S.of(context).saved,
                    style: AppStyles.s15w500.copyWith(
                      color: selectedIndex == 5 ? AppColors.gray900 : AppColors.gray600,
                      fontWeight: selectedIndex == 5 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                NavigationRailDestination(
                  icon: SvgPicture.asset(
                    selectedIndex == 6 ? AppAssets.svg.settingsBold : AppAssets.svg.settings,
                    color: selectedIndex == 6 ? AppColors.gray900 : AppColors.gray600,
                  ),
                  label: Text(
                    S.of(context).settings,
                    style: AppStyles.s15w500.copyWith(
                      color: selectedIndex == 6 ? AppColors.gray900 : AppColors.gray600,
                      fontWeight: selectedIndex == 6 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (int index) {
                selectedIndex = index;
                setState(() {});
              },
            ),
          Expanded(child: screens.elementAt(selectedIndex)),
        ],
      ),
    );
  }
}
