
import 'package:diploma_web/constants/app_styles.dart';
import 'package:diploma_web/src/features/navigation/widgets/log_out_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../localization/generated/l10n.dart';
import 'app_router/app_router.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key, required this.switchTo, required this.current}) : super(key: key);

  final void Function(int) switchTo;
  final int current;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
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
                      color: current == 0 ? AppColors.gray900 : AppColors.gray600,
                      fontWeight: current == 0 ? FontWeight.bold : FontWeight.normal,
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
                current == 1 ? AppAssets.svg.coursesBold : AppAssets.svg.courses,
                color: current == 1 ? AppColors.gray900 : AppColors.gray600,
              ),
              label: Text(
                S.of(context).courses,
                style: AppStyles.s15w500.copyWith(
                  color: current == 1 ? AppColors.gray900 : AppColors.gray600,
                  fontWeight: current == 1 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            NavigationRailDestination(
              icon: SvgPicture.asset(
                current == 2 ? AppAssets.svg.assignmentsBold : AppAssets.svg.assignments,
                color: current == 2 ? AppColors.gray900 : AppColors.gray600,
              ),
              label: Text(
                S.of(context).assignments,
                style: AppStyles.s15w500.copyWith(
                  color: current == 2 ? AppColors.gray900 : AppColors.gray600,
                  fontWeight: current == 2 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            NavigationRailDestination(
              icon: SvgPicture.asset(
                current == 3 ? AppAssets.svg.gradeBookBold : AppAssets.svg.gradeBook,
                color: current == 3 ? AppColors.gray900 : AppColors.gray600,
              ),
              label: Text(
                S.of(context).gradeBook,
                style: AppStyles.s15w500.copyWith(
                  color: current == 3 ? AppColors.gray900 : AppColors.gray600,
                  fontWeight: current == 3 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            NavigationRailDestination(
              icon: SvgPicture.asset(
                current == 4 ? AppAssets.svg.scheduleBold : AppAssets.svg.schedule,
                color: current == 4 ? AppColors.gray900 : AppColors.gray600,
              ),
              label: Text(
                S.of(context).schedule,
                style: AppStyles.s15w500.copyWith(
                  color: current == 4 ? AppColors.gray900 : AppColors.gray600,
                  fontWeight: current == 4 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            NavigationRailDestination(
              icon: SvgPicture.asset(
                current == 5 ? AppAssets.svg.savedBold : AppAssets.svg.saved,
                color: current == 5 ? AppColors.gray900 : AppColors.gray600,
              ),
              label: Text(
                S.of(context).saved,
                style: AppStyles.s15w500.copyWith(
                  color: current == 5 ? AppColors.gray900 : AppColors.gray600,
                  fontWeight: current == 5 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            NavigationRailDestination(
              icon: SvgPicture.asset(
                current == 6 ? AppAssets.svg.settingsBold : AppAssets.svg.settings,
                color: current == 6 ? AppColors.gray900 : AppColors.gray600,
              ),
              label: Text(
                S.of(context).settings,
                style: AppStyles.s15w500.copyWith(
                  color: current == 6 ? AppColors.gray900 : AppColors.gray600,
                  fontWeight: current == 6 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
          selectedIndex: current,
          onDestinationSelected: (int index) {
            switchTo(index);
          },
        ),
      ],
    );
  }
}
