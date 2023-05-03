import 'package:auto_route/auto_route.dart';
import 'package:diploma_web/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../widgets/app_back_button.dart';
import '../../../../widgets/course_container.dart';
import '../../../navigation/app_router/app_router.dart';
import '../../../profile/ui/profile_screen.dart';

class CoursesDetailed extends StatelessWidget {
  const CoursesDetailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 200),
          child: HeaderWidget(
            title: 'Courses > General English',
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppBackButton(
                      onTap: () {
                        context.router.popAndPush(const CoursesScreenRoute());
                      },
                    ),
                    const SizedBox(width: 34),
                    const CourseContainer(),
                    const SizedBox(width: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'General English',
                          style: AppStyles.s15w500,
                        ),
                        Text(
                          'Teacher: Alan Alexander',
                          style: AppStyles.s14w400.copyWith(
                            color: AppColors.gray600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 36),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, int index) {
                  return GestureDetector(
                      onTap: () => context.router.navigate(const CoursesDetailedLessonRoute()),
                      child: const CoursesDetailedCard());
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoursesDetailedCard extends StatelessWidget {
  const CoursesDetailedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 21),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.gray200,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.white,
                  child: Text(
                    '1',
                    style: AppStyles.s20w600.copyWith(
                      color: AppColors.gray900,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  'Week 1',
                  style: AppStyles.s18w500,
                ),
              ),
              SvgPicture.asset(AppAssets.svg.arrowRight2),
            ],
          ),
        ),
      ),
    );
  }
}
