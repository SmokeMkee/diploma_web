import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/constants/app_colors.dart';
import 'package:diploma_web/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeftSideBar extends StatelessWidget {
  const LeftSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        PhotoWidget(),
        ResumeWidget(),
      ],
    );
  }
}

class ResumeWidget extends StatelessWidget {
  const ResumeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Resume',
          style: AppStyles.s17w500,
        ),
        const SizedBox(height: 9),
        Text(
          'Here you can create your resume',
          style: AppStyles.s15w400.copyWith(color: AppColors.gray400),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
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
                        'My resumes',
                        style: AppStyles.s15w500.copyWith(color: AppColors.white),
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
  const PhotoWidget({Key? key}) : super(key: key);

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
            const Text(
              'Mary Jane',
              style: AppStyles.s18w500,
            ),
            const SizedBox(height: 6),
            Text(
              'Student',
              style: AppStyles.s15w400.copyWith(color: AppColors.gray600),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        'Upload photo',
                        style: AppStyles.s15w500.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppColors.gray200, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text('Delete', style: AppStyles.s15w500),
                    ),
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
