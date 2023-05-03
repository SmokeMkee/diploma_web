import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_colors.dart';
import '../features/localization/generated/l10n.dart';


class DisabilitiesButton extends StatelessWidget {
  const DisabilitiesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray200.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.svg.accessibility,
            color: AppColors.primary,
          ),
          const SizedBox(width: 16),
          Text(
            S.of(context).versionForPeopleWithDisabilities,
            style: AppStyles.s14w500,
          )
        ],
      ),
    );
  }
}
