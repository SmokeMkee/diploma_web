import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../constants/app_assets.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../widgets/course_container.dart';
import '../../../localization/generated/l10n.dart';

class AssignmentsCard extends StatelessWidget {
  const AssignmentsCard(
      {Key? key,
      required this.courseName,
      required this.title,
      required this.date})
      : super(key: key);
  final String courseName;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CourseContainer(),
                const SizedBox(width: 18),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.s15w500,
                    ),
                    Text(
                      courseName,
                      style: AppStyles.s14w400.copyWith(
                        color: AppColors.gray600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.svg.boldTime,
                  color: AppColors.gray600,
                ),
                const SizedBox(width: 10),
                Text(
                  date,
                  style: AppStyles.s14w500.copyWith(
                    color: AppColors.gray600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
