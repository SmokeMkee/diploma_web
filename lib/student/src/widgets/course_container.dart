import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';



class CourseContainer extends StatelessWidget {
  const CourseContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xff6B75C7),
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        'GE',
        style: AppStyles.s18w500.copyWith(color: AppColors.white),
      ),
    );
  }
}
