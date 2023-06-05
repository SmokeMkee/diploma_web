import 'package:auto_route/auto_route.dart';
import 'package:diploma_web/constants/app_styles.dart';
import 'package:diploma_web/student/src/features/courses/courses_detailed_lesson/ui/widgets/assignments_material.dart';
import 'package:diploma_web/student/src/features/courses/courses_detailed_lesson/ui/widgets/image_material.dart';
import 'package:diploma_web/student/src/features/courses/courses_detailed_lesson/ui/widgets/open_question_material.dart';
import 'package:diploma_web/student/src/features/courses/courses_detailed_lesson/ui/widgets/pdf_and_other_materials.dart';
import 'package:diploma_web/student/src/features/courses/courses_detailed_lesson/ui/widgets/text_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../constants/app_assets.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../widgets/app_back_button.dart';
import '../../../../widgets/app_divider.dart';
import '../../../navigation/app_router/app_router.dart';
import '../../../profile/ui/profile_screen.dart';
import '../data/bloc/unit_material_bloc.dart';
import '../data/bloc_material/section_material_bloc.dart';

class CoursesDetailedLesson extends StatelessWidget {
  const CoursesDetailedLesson(
      {Key? key,
      required this.unitSectionName,
      required this.courseName,
      required this.unitId,
      required this.courseId})
      : super(key: key);
  final String unitSectionName;
  final String courseName;
  final int unitId;
  final int courseId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 200),
          child: HeaderWidget(
            title: 'Courses>$courseName>$unitSectionName',
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CoursesMainContent(),
              const SizedBox(width: 75),
              CoursesLeftSideBar(
                unitName: unitSectionName,
                unitId: unitId,
                courseId: courseId,
              ),
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
            return BlocBuilder<SectionMaterialBloc, SectionMaterialState>(
              builder: (context, state) {
                if (state is SectionMaterialLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SectionMaterialError) {
                  return Text(state.message);
                }
                if (state is SectionMaterialData) {
                  return Column(
                    children: [
                      ContentHeader(
                        sectionName: state.sectionName,
                      ),
                      const SizedBox(height: 15),
                      AppDivider(
                        width: constraints.maxWidth,
                      ),
                      const SizedBox(height: 33),
                      ListView.builder(
                        itemCount: state.listMaterial.length,
                        shrinkWrap: true,
                        itemBuilder: (context, int index) {
                          Widget? widget;
                          var type = state.listMaterial[index].flagCreationInfo;
                          switch (type) {
                            case 'Picture':
                              widget = ImageMaterial(
                                image: state.listMaterial[index].fileData ?? '',
                              );
                              break;
                            case 'Pdf and other materials':
                              widget = PdfAndOtherMaterials(
                                  file: state.listMaterial[index].fileData ??
                                      '');
                              break;
                            case 'Open questions':
                              widget = OpenQuestionMaterial(
                                  question:
                                      state.listMaterial[index].question ??
                                          '');
                              break;
                            case 'Text':
                              widget = TextMaterial(
                                articleHeading:
                                    state.listMaterial[index].articleHeading,
                                textMarker:
                                    state.listMaterial[index].textMarker,
                                articleText:
                                    state.listMaterial[index].articleText,
                              );
                              break;
                            case 'Dividing line':
                              widget =  AppDivider(width:constraints.maxWidth ,margin: EdgeInsets.symmetric(vertical: 20),);
                              break;
                          }
                          return widget ?? const SizedBox.shrink();
                        },
                      ),
                      if (state.assignmentMaterial != null)
                        AssignmentMaterial(
                          articleHeading:
                              state.assignmentMaterial!.heading ?? '',
                          dueDate: state.assignmentMaterial!.endDate ?? '',
                          instructions:
                              state.assignmentMaterial!.instructions ?? '',
                          material: state.assignmentMaterial!.material ?? '',
                        )
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
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
                (index) =>
                    'https://www.gannett-cdn.com/presto/2021/03/22/NRCD/9d9dd9e4-e84a'
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
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
                child: SvgPicture.asset(AppAssets.svg.arrowLeft2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 31),
                child: Text('$currentPage out of 10'),
              ),
              GestureDetector(
                onTap: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
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
  const LessonPageBuilder(
      {Key? key,
      required this.controller,
      required this.imagePath,
      required this.valueChanged})
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
  const ContentHeader({Key? key, required this.sectionName}) : super(key: key);
  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBackButton(
          onTap: () {
            context.popRoute();
          },
        ),
        const SizedBox(width: 34),
        Text(
          sectionName,
          style: AppStyles.s18w500,
        ),
        const Spacer(),
      ],
    );
  }
}

class CoursesLeftSideBar extends StatefulWidget {
  const CoursesLeftSideBar(
      {Key? key,
      required this.unitName,
      required this.unitId,
      required this.courseId})
      : super(key: key);
  final String unitName;
  final int unitId;
  final int courseId;

  @override
  State<CoursesLeftSideBar> createState() => _CoursesLeftSideBarState();
}

class _CoursesLeftSideBarState extends State<CoursesLeftSideBar> {
  @override
  void initState() {
    context.read<UnitMaterialBloc>().add(
          FetchSectionUnitMaterialEvent(
              unitId: widget.unitId, courseId: widget.courseId),
        );

    super.initState();
  }

  int selectedTab = 0;

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
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.subtitleBg,
                          ),
                          child: Text(
                            widget.unitName,
                            style: AppStyles.s14w500
                                .copyWith(color: AppColors.subtitle),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                AppDivider(
                  width: constraints.maxWidth,
                ),
                const SizedBox(height: 25),
                BlocConsumer<UnitMaterialBloc, UnitMaterialState>(
                  listener: (context, state) {
                    if (state is UnitMaterialData) {
                      context.read<SectionMaterialBloc>().add(
                            FetchSectionMaterialEvent(
                              unitId: widget.unitId,
                              courseId: widget.courseId,
                              sectionId: state.tabs.first.id ?? 0,
                              sectionName:
                                  state.tabs.first.sectionName ?? 'no info',
                            ),
                          );
                    }
                  },
                  builder: (context, state) {
                    if (state is UnitMaterialData) {
                      return Column(
                        children: [
                          ...List.generate(
                            state.tabs.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTab = index;
                                });
                                context.read<SectionMaterialBloc>().add(
                                      FetchSectionMaterialEvent(
                                        unitId: widget.unitId,
                                        courseId: widget.courseId,
                                        sectionId: state.tabs[index].id ?? 0,
                                        sectionName:
                                            state.tabs[index].sectionName ??
                                                'no info',
                                      ),
                                    );
                              },
                              child: LeftSideBarTabsTile(
                                title:
                                    state.tabs[index].sectionName ?? 'no info',
                                selected: selectedTab == index,
                              ),
                            ),
                          )
                        ],
                      );
                    }
                    if (state is UnitMaterialError) {
                      return Text(state.message);
                    }
                    if (state is UnitMaterialLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const SizedBox.shrink();
                  },
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
  const LeftSideBarTabsTile(
      {Key? key, required this.title, required this.selected})
      : super(key: key);
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: selected ? 6 : 4,
            backgroundColor: selected ? AppColors.accent : AppColors.gray600,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: AppStyles.s15w500.copyWith(
                color: selected ? AppColors.accent : AppColors.gray600),
          )
        ],
      ),
    );
  }
}
