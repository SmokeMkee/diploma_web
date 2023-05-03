import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../constants/app_assets.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../widgets/course_container.dart';
import '../../data/dto/courses.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key, required this.courses}) : super(key: key);
  final Courses courses;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(31, 27, 22, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CourseContainer(),
                  SvgPicture.asset(AppAssets.svg.threeDots),
                ],
              ),
              const SizedBox(height: 23),
               Text(
                courses.courseName ?? 'Course',
                style: AppStyles.s18w500,
              ),
              const SizedBox(height: 9),
              // Text(
              //   courses.email ?? '',
              //   style: AppStyles.s14w400.copyWith(color: AppColors.gray600),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
