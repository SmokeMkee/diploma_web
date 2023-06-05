import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/student/src/features/courses/courses_detailed/data/dto/unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../widgets/app_back_button.dart';
import '../../../../widgets/course_container.dart';
import '../../../localization/generated/l10n.dart';
import '../../../navigation/app_router/app_router.dart';
import '../../../profile/ui/profile_screen.dart';
import '../data/bloc/courses_detailed_bloc.dart';

class CoursesDetailed extends StatefulWidget {
  const CoursesDetailed(
      {Key? key, required this.courseId, required this.courseName})
      : super(key: key);
  final int courseId;
  final String courseName;

  @override
  State<CoursesDetailed> createState() => _CoursesDetailedState();
}

class _CoursesDetailedState extends State<CoursesDetailed> {
  @override
  void didChangeDependencies() {
    context.read<CoursesDetailedBloc>().add(
          FetchUnits(
            unitId: widget.courseId,
          ),
        );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 200),
          child: HeaderWidget(
            title: 'Courses > ${widget.courseName}',
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppBackButton(
                      onTap: () {
                        context.router.popAndPush(const CoursesScreenRoute());
                      },
                    ),
                    const SizedBox(width: 34),
                    const CourseContainer(),
                    const SizedBox(width: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.courseName,
                          style: AppStyles.s15w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 36),
            BlocBuilder<CoursesDetailedBloc, CoursesDetailedState>(
              builder: (context, state) {
                if (state is CoursesDetailedData) {
                  return state.list.isEmpty
                      ? const Center(
                          child: Text('Course units is empty'),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, int index) {
                              return GestureDetector(
                                onTap: () => context.router.navigate(
                                  CoursesDetailedLessonRoute(
                                    unitSectionName:
                                        state.list[index].unitName ?? 'no info',
                                    courseName: widget.courseName,
                                    unitId: state.list[index].id ?? 0,
                                    courseId: widget.courseId,
                                  ),
                                ),
                                child: CoursesDetailedCard(
                                  unit: state.list[index],
                                ),
                              );
                            },
                            itemCount: state.list.length,
                          ),
                        );
                }
                if (state is CoursesDetailedLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CoursesDetailedError) {
                  return Center(
                    child: Text(S.of(context).errorText),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CoursesDetailedCard extends StatelessWidget {
  const CoursesDetailedCard({Key? key, required this.unit}) : super(key: key);
  final Unit unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 21),
          child: Row(
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
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  unit.unitName ?? 'Unit',
                  style: AppStyles.s18w500,
                ),
              ),
              SvgPicture.asset(AppAssets.svg.arrowRight2),
            ],
          ),
        ),
      ),
    );
  }
}
