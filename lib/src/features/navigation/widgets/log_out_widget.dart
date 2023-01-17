import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../auth/sign_in/ui/authorization_screen.dart';
import '../../localization/generated/l10n.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 46),
          child: GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AuthorizationScreen(),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppAssets.svg.logOut,
                  color: AppColors.gray600,
                ),
                const SizedBox(width: 20),
                Text(
                  S.of(context).logOut,
                  style: AppStyles.s15w500.copyWith(color: AppColors.gray600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
