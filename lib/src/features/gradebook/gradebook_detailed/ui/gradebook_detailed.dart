import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/src/features/navigation/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../../widgets/app_back_button.dart';
import '../../../../widgets/course_container.dart';
import '../../../profile/ui/profile_screen.dart';

class GradeBookDetailed extends StatelessWidget {
  const GradeBookDetailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
          child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size(double.infinity, 200),
              child: HeaderWidget(
                title: 'gradebook > general english',
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
                            context.router.popAndPush(const GradeBookScreenRoute());
                          },
                        ),
                        const SizedBox(width: 34),
                        const CourseContainer(),
                        const SizedBox(width: 25),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'General English',
                              style: AppStyles.s15w500,
                            ),
                            Text(
                              'Teacher: Alan Alexander',
                              style: AppStyles.s14w400.copyWith(
                                color: AppColors.gray600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        PerformanceTile(
                          title: 'Total score',
                          titleValue: '97.65%',
                        ),
                        PerformanceTile(
                          title: 'Attendance',
                          titleValue: '97.65%',
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 55),
                TabBar(
                  unselectedLabelColor: AppColors.gray600,
                  indicatorWeight: 6,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: AppColors.accent,
                  labelColor: AppColors.accent,
                  labelStyle: AppStyles.s15w500.copyWith(color: AppColors.accent),
                  tabs: const [
                    Text('Grades'),
                    Text('Attendance'),
                  ],
                ),
                const SizedBox(height: 21),
                const Expanded(
                  child: TabBarView(
                    children: [
                      GradesTableWidget(),
                      TableCalendars(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TableCalendars extends StatefulWidget {
  const TableCalendars({Key? key}) : super(key: key);

  @override
  State<TableCalendars> createState() => _TableCalendarsState();
}

class _TableCalendarsState extends State<TableCalendars> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TableCalendar(
        rowHeight: 90,
        firstDay: DateTime.utc(2010, 10, 20),
        lastDay: DateTime.utc(2040, 10, 20),
        focusedDay: DateTime.now(),
        headerVisible: true,
        daysOfWeekVisible: true,
        sixWeekMonthsEnforced: false,
        shouldFillViewport: false,

        eventLoader: (day){
          if (day.day == 3) {
            return ['Lesson 1'];
          }
          if (day.day == 5) {
            return ['Lesson 2'];
          }
          if (day.day == 7) {
            return ['Lesson 3'];
          }
          if (day.day == 10) {
            return ['Lesson 4'];
          }
          if (day.day == 12) {
            return ['Lesson 5'];
          }
          if (day.day == 14) {
            return ['Lesson 6'];
          }
          if (day.day == 17) {
            return ['Lesson 7'];
          }
          return [];
        },

        calendarStyle: const CalendarStyle(
          markerSizeScale: 1,
          markerMargin: EdgeInsets.zero,
          markerDecoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.rectangle,
          ),
            rangeStartDecoration : BoxDecoration(
                color: AppColors.audioLine
            ),
            defaultDecoration:BoxDecoration(
                color: AppColors.audioLine
            ),
            cellMargin : EdgeInsets.zero,
          tableBorder: TableBorder(
            top: BorderSide(color: AppColors.gray200),
            left: BorderSide(color: AppColors.gray200),
            right: BorderSide(color: AppColors.gray200),
            bottom: BorderSide(color: AppColors.gray200),
            verticalInside: BorderSide(
              width: 1,
              color: AppColors.gray200,
              style: BorderStyle.solid,
            ),
            horizontalInside: BorderSide(
              width: 1,
              color: AppColors.gray200,
              style: BorderStyle.solid,
            ),
          ),
          todayDecoration: BoxDecoration(
            color: AppColors.audioLine
          )

        ),
      ),
    );
  }
}

class GradesTableWidget extends StatelessWidget {
  const GradesTableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TableBody(
        data: [
          TableInfo(
            assignments: 'Classwork_1',
            status: 'Submitted',
            feedback: false,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Homework',
            status: 'Graded',
            feedback: true,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Task2',
            status: 'Submitted',
            feedback: false,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Quiz',
            status: 'Past due',
            feedback: true,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Classwork_1',
            status: 'Submitted',
            feedback: false,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Homework',
            status: 'Graded',
            feedback: true,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Task2',
            status: 'Submitted',
            feedback: false,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Quiz',
            status: 'Past due',
            feedback: true,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Classwork_1',
            status: 'Submitted',
            feedback: false,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Homework',
            status: 'Graded',
            feedback: true,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Task2',
            status: 'Submitted',
            feedback: false,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Quiz',
            status: 'Past due',
            feedback: true,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Classwork_1',
            status: 'Submitted',
            feedback: false,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Homework',
            status: 'Graded',
            feedback: true,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Task2',
            status: 'Submitted',
            feedback: false,
            mark: '-',
          ),
          TableInfo(
            assignments: 'Quiz',
            status: 'Past due',
            feedback: true,
            mark: '-',
          ),
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
              3: FlexColumnWidth(1),
            },
            children: [
              const TableRow(
                children: [
                  HeaderTableText(text: 'Assignments'),
                  HeaderTableText(text: 'Status'),
                  HeaderTableText(text: 'Mark'),
                  HeaderTableText(text: 'Feedback'),
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
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child:
                            e.feedback == true ? SvgPicture.asset(AppAssets.svg.feedback) : const SizedBox.shrink(),
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
    required this.feedback,
    required this.mark,
  });

  final String assignments;
  final String status;
  final String mark;
  final bool feedback;
}

class PerformanceTile extends StatelessWidget {
  const PerformanceTile({Key? key, required this.title, required this.titleValue}) : super(key: key);
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
