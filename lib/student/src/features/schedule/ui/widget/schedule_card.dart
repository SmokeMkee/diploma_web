import 'package:flutter/material.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../widgets/course_container.dart';
import '../../../localization/generated/l10n.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard(
      {Key? key,
      required this.courseName,
      required this.sectionName,
      required this.startDate,
      required this.endDate})
      : super(key: key);
  final String courseName;
  final String sectionName;
  final String startDate;
  final String endDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              courseName,
                              style: AppStyles.s15w500,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.subtitleBg,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.5, horizontal: 10),
                              child: Text(
                                sectionName,
                                style: AppStyles.s14w500
                                    .copyWith(color: AppColors.subtitle),
                              ),
                            )
                          ],
                        ),
                        Text(
                          startDate +' - ' +  endDate,
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
          ),
        ),
      ),
    );
  }
}
