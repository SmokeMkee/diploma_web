import 'package:diploma_web/student/src/features/schedule/ui/widget/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../localization/generated/l10n.dart';
import '../../profile/ui/profile_screen.dart';
import 'data/bloc/schedule_bloc.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  void initState() {
    context.read<ScheduleBloc>().add(FetchScheduleEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 200),
          child: HeaderWidget(
            title: S.of(context).schedule,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: const [
            SizedBox(height: 50),
            Expanded(child: ScheduleBody()),
          ],
        ),
      ),
    );
  }
}

class ScheduleBody extends StatelessWidget {
  const ScheduleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleBloc, ScheduleState>(builder: (context, state) {
      if (state is ScheduleData) {
        return Column(
          children: [
            ...List.generate(
              2,
              (index) => Column(
                children: [
                  HeaderBody(
                    day: DateFormat('EEEE').format(
                      DateTime.parse(
                        state.listSchedule[0].lessonTime ??
                            DateTime.now().toString(),
                      ),
                    ),
                    fullDate: DateFormat('MMMM d, yyyy').format(
                      DateTime.parse(
                        state.listSchedule[0].lessonTime ??
                            DateTime.now().toString(),
                      ),
                    ),
                  ),
                  ...List.generate(
                    3,
                    (index1) => ScheduleCard(
                      courseName:
                          state.listSchedule[0].courseName ?? 'no info',
                      sectionName:
                          state.listSchedule[0].courseName ?? 'no info',
                      startDate: DateFormat('HH:mm').format(
                        DateTime.parse(
                          state.listSchedule[0].lessonTime ??
                              DateTime.now().toString(),
                        ),
                      ),
                      endDate: DateFormat('HH:mm').format(
                        DateTime.parse(
                          state.listSchedule[0].lessonDuration ??
                              DateTime.now().toString(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
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
      return const SizedBox.shrink();
    });
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
