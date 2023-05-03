import 'package:auto_route/auto_route.dart';
import 'package:diploma_web/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../constants/app_assets.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../widgets/app_back_button.dart';
import '../../../../widgets/app_divider.dart';
import '../../../localization/generated/l10n.dart';
import '../../../navigation/app_router/app_router.dart';
import '../../../profile/ui/profile_screen.dart';

class CoursesDetailedLesson extends StatelessWidget {
  const CoursesDetailedLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 200),
          child: HeaderWidget(
            title: S.of(context).coursesGeneralEnglishWeek1,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CoursesMainContent(),
              SizedBox(width: 75),
              CoursesLeftSideBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class CoursesMainContent extends StatelessWidget {
  const CoursesMainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ContentHeader(),
                const SizedBox(height: 15),
                AppDivider(
                  width: constraints.maxWidth,
                ),
                const SizedBox(height: 33),
                const LectureInfoContainer(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        label: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Text(
                            S.of(context).downloadPdf,
                            style: AppStyles.s15w500.copyWith(color: AppColors.white),
                          ),
                        ),
                        icon: SvgPicture.asset(
                          AppAssets.svg.downloadBold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                AppDivider(
                  width: constraints.maxWidth,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class LectureInfoContainer extends StatefulWidget {
  const LectureInfoContainer({Key? key}) : super(key: key);

  @override
  State<LectureInfoContainer> createState() => _LectureInfoContainerState();
}

class _LectureInfoContainerState extends State<LectureInfoContainer> {
  PageController pageController = PageController();

  int getCurrentIndex() {
    return pageController.page!.round();
  }

  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.gray200,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.gray200.withOpacity(0.1),
      ),
      child: Column(
        children: [
          LessonPageBuilder(
            controller: pageController,
            imagePath: [
              ...List.generate(
                10,
                (index) => 'https://www.gannett-cdn.com/presto/2021/03/22/NRCD/9d9dd9e4-e84a'
                    '-402e-ba8f-daa659e6e6c5-PhotoWord_003'
                    '.JPG?width=1320&height=850&fit=crop&format=pjpg&auto=webp',
              ),
            ],
            valueChanged: (int value) {
              setState(() {
                currentPage = value + 1;
              });
            },
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                },
                child: SvgPicture.asset(AppAssets.svg.arrowLeft2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 31),
                child: Text('$currentPage out of 10'),
              ),
              GestureDetector(
                onTap: () {
                  pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                },
                child: SvgPicture.asset(AppAssets.svg.arrowRight2),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class LessonPageBuilder extends StatelessWidget {
  const LessonPageBuilder({Key? key, required this.controller, required this.imagePath, required this.valueChanged})
      : super(key: key);
  final PageController controller;
  final List<String> imagePath;
  final ValueChanged<int> valueChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        onPageChanged: valueChanged,
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imagePath[index],
              height: 500,
              fit: BoxFit.fitWidth,
            ),
          );
        },
        itemCount: imagePath.length,
      ),
    );
  }
}

class ContentHeader extends StatelessWidget {
  const ContentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBackButton(
          onTap: () {
            context.router.popAndPush(const CoursesDetailedRoute());
          },
        ),
        const SizedBox(width: 34),
        const Text(
          'PRESENT PERFECT',
          style: AppStyles.s18w500,
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: AppColors.gray200.withOpacity(0.2),
          radius: 25,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(AppAssets.svg.saved),
          ),
        )
      ],
    );
  }
}

class CoursesLeftSideBar extends StatelessWidget {
  const CoursesLeftSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 34),
        decoration: BoxDecoration(
          color: AppColors.gray200.withOpacity(0.1),
          border: Border.all(color: AppColors.gray200, width: 2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.gray200,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.white,
                        child: Text(
                          '1',
                          style: AppStyles.s20w600.copyWith(
                            color: AppColors.gray900,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.subtitleBg,
                          ),
                          child: Text(
                            'Lecture',
                            style: AppStyles.s14w500.copyWith(color: AppColors.subtitle),
                          ),
                        ),
                        const SizedBox(height: 9),
                        const Text(
                          'Week 1',
                          style: AppStyles.s20w600,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                AppDivider(
                  width: constraints.maxWidth,
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    LeftSideBarTabsTile(title: S.of(context).lecture, selected: true,),
                    LeftSideBarTabsTile(title: S.of(context).classWork, selected: false,),
                    LeftSideBarTabsTile(title: S.of(context).homeWork, selected: false,),
                    LeftSideBarTabsTile(title: S.of(context).quiz1, selected: false,),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class LeftSideBarTabsTile extends StatelessWidget {
  const LeftSideBarTabsTile({Key? key, required this.title, required this.selected}) : super(key: key);
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius:selected ?  6 : 4,
            backgroundColor: selected ? AppColors.accent : AppColors.gray600,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: AppStyles.s15w500.copyWith(color: selected ? AppColors.accent : AppColors.gray600),
          )
        ],
      ),
    );
  }
}
