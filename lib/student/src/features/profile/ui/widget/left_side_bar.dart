import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/constants/app_colors.dart';
import 'package:diploma_web/constants/app_styles.dart';
import 'package:diploma_web/student/src/features/localization/i_locale_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../localization/generated/l10n.dart';
import '../../../navigation/app_router/app_router.dart';

class LeftSideBar extends StatelessWidget {
  const LeftSideBar({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PhotoWidget(
          userName: userName,
        ),
        //ResumeWidget(),
      ],
    );
  }
}

class ResumeWidget extends StatelessWidget {
  const ResumeWidget({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).resume,
          style: AppStyles.s17w500,
        ),
        const SizedBox(height: 9),
        Text(
          S.of(context).hereYouCanCreateYourResume,
          style: AppStyles.s15w400.copyWith(color: AppColors.gray400),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  context.router.push(const MyResumesRoute());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).myResumes,
                        style:
                            AppStyles.s15w500.copyWith(color: AppColors.white),
                      ),
                      const SizedBox(width: 13),
                      SvgPicture.asset(
                        AppAssets.svg.arrowRight,
                        color: AppColors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const CircleAvatar(
              radius: 70.0,
              backgroundImage: NetworkImage(
                'https://thumbs.dreamstime.com/b/businessman-icon-image-male-'
                'avatar-profile-vector-glasses-beard-hairstyle-179728610.jpg',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              userName,
              style: AppStyles.s18w500,
            ),
            const SizedBox(height: 6),
            Text(
              S.of(context).student,
              style: AppStyles.s15w400.copyWith(color: AppColors.gray600),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AppElevatedButton(
                    title: S.of(context).uploadPhoto,
                    onTap: () async {
                      await context.read<ILocaleRepo>().apply('kk');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AppBorderButton(
                    title: S.of(context).delete,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(
          title,
          style: AppStyles.s15w500.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}

class AppBorderButton extends StatelessWidget {
  const AppBorderButton({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.gray200, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(title, style: AppStyles.s15w500),
      ),
    );
  }
}
