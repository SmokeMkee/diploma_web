import 'package:flutter/material.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../widgets/course_container.dart';
import '../../../localization/generated/l10n.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

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
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.greenAccent, width: 5),
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
                                S.of(context).generalEnglish,
                                style: AppStyles.s15w500,
                              ),
                              const SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.subtitleBg,
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                                child: Text(
                                  S.of(context).lecture,
                                  style: AppStyles.s14w500.copyWith(color: AppColors.subtitle),
                                ),
                              )
                            ],
                          ),
                          Text(
                            '08:15-9:15',
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
      ),
    );
  }
}
