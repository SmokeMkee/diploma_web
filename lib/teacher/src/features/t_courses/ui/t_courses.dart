import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/constants/app_colors.dart';
import 'package:diploma_web/constants/app_styles.dart';
import 'package:diploma_web/student/src/features/navigation/app_router/app_router.dart';
import 'package:diploma_web/student/src/features/profile/ui/widget/left_side_bar.dart';
import 'package:diploma_web/student/src/widgets/app_divider.dart';
import 'package:diploma_web/student/src/widgets/app_drop_down_button.dart';
import 'package:diploma_web/student/src/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../student/src/features/courses/ui/courses_screen.dart';
import '../../../../../student/src/features/courses/ui/widget/course_card.dart';
import '../../../../../student/src/features/profile/ui/profile_screen.dart';

class TCourses extends StatelessWidget {
  const TCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 200),
            child: HeaderWidget(
              title: 'Courses',
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(width: 30),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchWidget(),
                    const SizedBox(height: 40),
                    const TabBar(
                      labelColor: AppColors.accent,
                      labelStyle: AppStyles.s15w500,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 6,
                      tabs: [
                        Tab(text: 'All courses'),
                        Tab(text: '+ new category'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          GridView.count(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            children: [
                              GestureDetector(
                                child: const CreateCourseCard(),

                              ),
                              ...List.generate(
                                4,
                                (index) {
                                  return GestureDetector(
                                    // onTap: () => context.router.push(
                                    //   const TCoursesDetailedRoute(),
                                    // ),
                                    child: const CourseCard(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateCourseCard extends StatelessWidget {
  const CreateCourseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: GestureDetector(
        onTap: () {
          showAlertDialogCreateCourse(context);
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(31, 27, 22, 62),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.gray400,
                  child: SvgPicture.asset(AppAssets.svg.add),
                ),
                const SizedBox(height: 17),
                Text(
                  'Create new course',
                  style: AppStyles.s14w400.copyWith(
                    color: AppColors.gray600,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showAlertDialogCreateCourse(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      titleTextStyle: AppStyles.s20w600,
      titlePadding: const EdgeInsets.symmetric(vertical: 29, horizontal: 44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: AppBorderButton(
                title: 'Cancel',
                onTap: () {
                  context.router.pop();
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: AppElevatedButton(
                title: 'Create',
                onTap: () {
                  context.router.pop();
                },
              ),
            )
          ],
        )
      ],
      title: const Text('New course'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width / 3.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Text('Title'),
                SizedBox(width: 54),
                Expanded(
                  child: AppTextField(hintText: 'Enter the title'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Container(
                height: 2,
                color: AppColors.gray200,
              ),
            ),
            Row(
              children: const [
                Text('Category'),
                SizedBox(width: 20),
                Expanded(child: AppDropDownButton(items: [], initial: ''))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Container(
                height: 2,
                color: AppColors.gray200,
              ),
            ),
            Row(
              children: [
                const Text('Color'),
                const SizedBox(width: 20),
                ...List.generate(
                  5,
                  (index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.pink,
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
