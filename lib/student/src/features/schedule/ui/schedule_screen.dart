import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/student/src/features/schedule/ui/widget/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../widgets/empty_widget.dart';
import '../../localization/generated/l10n.dart';
import '../../profile/ui/profile_screen.dart';
import '../data/bloc/schedule_bloc.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> days = [
      'MONDAY',
      'TUESDAY',
      'WEDNESDAY',
      'THURSDAY',
      'FRIDAY',
      'SATURDAY',
      'SUNDAY'
    ];
    return DefaultTabController(
      length: 7,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 200),
            child: HeaderWidget(
              title: S.of(context).schedule,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const TabBar(
                isScrollable: false,
                indicatorColor: AppColors.accent,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: AppColors.primary,
                labelStyle: AppStyles.s17w500,
                unselectedLabelColor: AppColors.gray600,
                tabs: [
                  Text('Mon'),
                  Text('Tue'),
                  Text('Wed'),
                  Text('Thur'),
                  Text('Fri'),
                  Text('Sat'),
                  Text('Sun'),
                ],
              ),
              const SizedBox(height: 50),
              Expanded(
                child: TabBarView(
                  children: [
                    ...List.generate(
                      days.length,
                      (index) => ScheduleList(
                        day: days[index],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleList extends StatefulWidget {
  final String day;

  const ScheduleList({Key? key, required this.day}) : super(key: key);

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  void initState() {
    context.read<ScheduleBloc>().add(FetchScheduleEvent(day: widget.day));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      explicitChildNodes: true,
      enabled: true,
      child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          if (state is ScheduleLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ScheduleError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is ScheduleData) {
            return state.listSchedule.isEmpty
                ?  EmptyWidget(
                    imageAssetPath: AppAssets.images.emptyCourses,
                    text: 'Looks like you don\'t have a timetable yet, please wait for your teacher to add a lesson',
                  )
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, int index) {
                        DateTime dateTime = DateTime.parse(
                            state.listSchedule[index].lessonTime ?? '');

                        String time = DateFormat('HH:mm').format(DateTime.parse(
                            state.listSchedule[index].lessonTime ?? ''));
                        return ScheduleCard(
                          courseName:
                              state.listSchedule[index].courseName ?? 'no info',
                          sectionName:
                              state.listSchedule[index].id.toString() ??
                                  'no info',
                          startDate:
                          DateFormat('HH:mm').format(DateTime.parse(
                              state.listSchedule[index].lessonTime ?? '')) ?? 'no info',
                          endDate: DateFormat('HH:mm').format(DateTime.parse(
                              state.listSchedule[index].lessonTime ?? '')) ??
                              'no info',
                        );
                      },
                      shrinkWrap: true,
                      itemCount: state.listSchedule.length,
                    ),
                  );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class HeaderBody extends StatelessWidget {
  const HeaderBody({Key? key, required this.day, required this.fullDate})
      : super(key: key);
  final String day;
  final String fullDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullDate,
              style: AppStyles.s18w500,
            ),
            Text(
              day,
              style: AppStyles.s15w400.copyWith(
                color: AppColors.gray600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
