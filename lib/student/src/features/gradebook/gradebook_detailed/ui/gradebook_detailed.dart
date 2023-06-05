import 'package:diploma_web/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../../../../widgets/app_back_button.dart';
import '../../../../widgets/course_container.dart';
import '../../../localization/generated/l10n.dart';
import '../../../navigation/app_router/app_router.dart';
import '../../../profile/ui/profile_screen.dart';
import '../data/bloc/gradebook_detailed_bloc.dart';
import '../data/dto/dto_gradebook.dart';

class GradeBookDetailed extends StatefulWidget {
  const GradeBookDetailed(
      {Key? key,
      required this.courseId,
      required this.teacherName,
      required this.courseName})
      : super(key: key);
  final int courseId;
  final String teacherName;
  final String courseName;

  @override
  State<GradeBookDetailed> createState() => _GradeBookDetailedState();
}

class _GradeBookDetailedState extends State<GradeBookDetailed> {
  @override
  void initState() {
    context
        .read<GradebookDetailedBloc>()
        .add(FetchGradebookEvent(courseId: widget.courseId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 200),
            child: HeaderWidget(
              title: widget.courseName,
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
                          context.router
                              .popAndPush(const GradeBookScreenRoute());
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
                          Text(
                            widget.teacherName,
                            style: AppStyles.s14w400.copyWith(
                              color: AppColors.gray600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  BlocBuilder<GradebookDetailedBloc, GradebookDetailedState>(
                    builder: (context, state) {
                      if (state is GradebookDetailedData) {
                        return PerformanceTile(
                          title: S.of(context).totalScore,
                          titleValue: '${state.listGradeBook.total} % ',
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 55),
              const SizedBox(height: 21),
              Expanded(
                child:
                    BlocBuilder<GradebookDetailedBloc, GradebookDetailedState>(
                  builder: (context, state) {
                    if (state is GradebookDetailedData) {
                      return GradesTableWidget(
                        list: state.listGradeBook,
                      );
                    }
                    if (state is GradebookDetailedLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is GradebookDetailedError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GradesTableWidget extends StatelessWidget {
  const GradesTableWidget({Key? key, required this.list}) : super(key: key);
  final GradeBook list;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TableBody(
        data: [
          ...List.generate(
            list.studentGradeBookDtoList?.length ?? 0,
            (index) => TableInfo(
              assignments:
                  list.studentGradeBookDtoList?[index].sectionName ?? 'no info',
              status: 'status',
              mark: list.studentGradeBookDtoList?[index].grade ?? 'no info',
            ),
          )
        ],
      ),
    );
  }
}

class HeaderTableText extends StatelessWidget {
  const HeaderTableText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 13, 0, 13),
      child: Text(
        text,
        style: AppStyles.s15w500.copyWith(color: AppColors.gray600),
      ),
    );
  }
}

class BodyTableText extends StatelessWidget {
  const BodyTableText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 13, 22, 13),
      child: Text(
        text,
        style: AppStyles.s15w500,
      ),
    );
  }
}

class TableBody extends StatelessWidget {
  const TableBody({Key? key, required this.data}) : super(key: key);
  final List<TableInfo> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          width: 1,
          color: AppColors.gray200,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Table(
            border: const TableBorder(
              horizontalInside: BorderSide(
                width: 1,
                color: AppColors.gray200,
                style: BorderStyle.solid,
              ),
            ),
            columnWidths: const {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                children: [
                  HeaderTableText(text: S.of(context).assignments),
                  HeaderTableText(text: S.of(context).status),
                  HeaderTableText(text: S.of(context).mark),
                ],
              ),
              ...data.map(
                (e) {
                  return TableRow(
                    children: [
                      TableCell(
                        child: BodyTableText(text: e.assignments),
                      ),
                      TableCell(
                        child: BodyTableText(text: e.status),
                      ),
                      TableCell(
                        child: BodyTableText(text: e.mark),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TableInfo {
  TableInfo({
    required this.assignments,
    required this.status,
    required this.mark,
  });

  final String assignments;
  final String status;
  final String mark;
}

class PerformanceTile extends StatelessWidget {
  const PerformanceTile(
      {Key? key, required this.title, required this.titleValue})
      : super(key: key);
  final String title;
  final String titleValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: AppStyles.s15w500.copyWith(color: AppColors.gray600),
        ),
        Text(
          titleValue,
          style: AppStyles.s15w500,
        )
      ],
    );
  }
}
