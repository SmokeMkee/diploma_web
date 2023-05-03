import 'package:auto_route/auto_route.dart';
import 'package:diploma_web/student/src/features/navigation/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../../../student/src/features/profile/ui/profile_screen.dart';
import '../../../../../student/src/features/profile/ui/widget/left_side_bar.dart';
import '../../../../../student/src/widgets/app_text_field.dart';
import '../../../../../student/src/widgets/app_text_form_field.dart';
import '../../../../../student/src/widgets/course_container.dart';

class TGroups extends StatelessWidget {
  const TGroups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 200),
            child: HeaderWidget(
              title: 'Groups',
              withDisabilities: false,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 450,
                    child: AppTextFormField(
                      hintText: 'search',
                      hintStyle:
                          AppStyles.s14w500.copyWith(color: AppColors.gray400),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: SvgPicture.asset(
                          AppAssets.svg.search,
                          color: AppColors.gray200,
                        ),
                      ),
                    ),
                  ),
                  AppElevatedIconButton(
                    text: 'Create new group',
                    onTap: () {
                      showAlertDialogCreateGroup(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      // onTap: () => context.router.push(const TGroupDetailedRoute()),
                      child: const TGroupCard(),
                    );
                  },
                  itemCount: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppElevatedIconButton extends StatelessWidget {
  const AppElevatedIconButton(
      {Key? key, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onTap,
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(
          text,
          style: AppStyles.s15w500.copyWith(color: AppColors.white),
        ),
      ),
      icon: SvgPicture.asset(
        AppAssets.svg.add,
        color: AppColors.white,
      ),
    );
  }
}

class TGroupCard extends StatelessWidget {
  const TGroupCard({Key? key}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: const [
                  CourseContainer(),
                  SizedBox(width: 18),
                  Text(
                    'ITIS -1914',
                    style: AppStyles.s15w500,
                  ),
                ],
              ),
              SvgPicture.asset(AppAssets.svg.arrowRight2)
            ],
          ),
        ),
      ),
    );
  }
}

void showAlertDialogCreateGroup(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      titleTextStyle: AppStyles.s20w600,
      titlePadding: const EdgeInsets.symmetric(vertical: 29, horizontal: 44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: AppBorderButton(
                title: 'Cancel',
                onTap: () {
                  context.router.pop();
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: AppElevatedButton(
                title: 'Create',
                onTap: () {
                  context.router.pop();
                },
              ),
            )
          ],
        )
      ],
      title: const Text('New group'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width / 3.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Text('Title'),
                SizedBox(width: 54),
                Expanded(
                  child: AppTextField(hintText: 'Enter the title'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Container(
                height: 2,
                color: AppColors.gray200,
              ),
            ),
            Row(
              children: [
                const Text('Color'),
                const SizedBox(width: 20),
                ...List.generate(
                  5,
                  (index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.pink,
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
