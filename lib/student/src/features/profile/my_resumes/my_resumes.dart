import 'package:auto_route/auto_route.dart';
import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/constants/app_colors.dart';
import 'package:diploma_web/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/app_back_button.dart';
import '../../localization/generated/l10n.dart';
import '../../navigation/app_router/app_router.dart';
import '../ui/profile_screen.dart';

class MyResumes extends StatelessWidget {
  const MyResumes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 200),
          child: HeaderWidget(
            title: 'Profile > my resumes',
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 39),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBackButton(
                  onTap: () {
                    context.router.popAndPush(const ProfileScreenRoute());
                  },
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    //context.router.navigate(const CreateResumeRoute());
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SvgPicture.asset(
                      AppAssets.svg.add,
                      color: AppColors.white,
                    ),
                  ),
                  label: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 14, bottom: 14, right: 20),
                    child: Text(
                      S.of(context).createResume,
                      style: AppStyles.s15w500.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 31),
            Text(
              S.of(context).myResumes,
              style: AppStyles.s15w500,
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, int index) {
                  return const ResumeCard();
                },
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResumeCard extends StatelessWidget {
  const ResumeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, top: 20, bottom: 25, right: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).englishTeacher,
                    style: AppStyles.s15w500,
                  ),
                  Text(
                    S.of(context).lastUpdateWas15January2023At0038,
                    style: AppStyles.s11w400.copyWith(color: AppColors.gray600),
                  ),
                ],
              ),
              SvgPicture.asset(AppAssets.svg.reversedDots),
            ],
          ),
        ),
      ),
    );
  }
}
