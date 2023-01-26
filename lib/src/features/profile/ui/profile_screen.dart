import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/constants/app_colors.dart';
import 'package:diploma_web/constants/app_styles.dart';
import 'package:diploma_web/src/features/profile/ui/widget/body.dart';
import 'package:diploma_web/src/features/profile/ui/widget/left_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/disabilities_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 200),
          child: HeaderWidget(
            title: 'Profile',
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Row(
          children: const [
            Expanded(
              flex: 4,
              child: SingleChildScrollView(child: ProfileBodyWidget()),
            ),
            SizedBox(width: 100),
            Expanded(
              child: LeftSideBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title.toUpperCase(),
            style: AppStyles.s20w600,
          ),
        ),
        CircleAvatar(
          radius: 27,
          backgroundColor: AppColors.gray200.withOpacity(0.2),
          child: SvgPicture.asset(
            AppAssets.svg.notification,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 27),
        const DisabilitiesButton(),
      ],
    );
  }
}
