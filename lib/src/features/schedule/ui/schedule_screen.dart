import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../profile/ui/profile_screen.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 200),
            child: HeaderWidget(
              title: 'schedule',
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 50),
              TabBar(
                unselectedLabelColor: AppColors.gray600,
                indicatorWeight: 6,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: AppColors.accent,
                labelColor: AppColors.accent,
                labelStyle: AppStyles.s15w500.copyWith(color: AppColors.accent),
                tabs: const [
                  Tab(
                    text: 'Monday',
                  ),
                  Tab(
                    text: 'Tuesday',
                  ),
                  Tab(
                    text: 'Wednesday',
                  ),
                  Tab(
                    text: 'Thusday',
                  ),
                  Tab(
                    text: 'Friday',
                  ),
                  Tab(
                    text: 'Saturday',
                  ),
                  Tab(
                    text: 'Sunday',
                  ),
                ],
              ),
              Divider(),
              const SizedBox(height: 44),
              const Expanded(
                child: TabBarView(
                  children: [
                    ScheduleBody(),
                    ScheduleBody(),
                    ScheduleBody(),
                    ScheduleBody(),
                    ScheduleBody(),
                    ScheduleBody(),
                    ScheduleBody(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleBody extends StatelessWidget {
  const ScheduleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'April 12, 2023',
              style: AppStyles.s18w500,
            ),
            Text(
              'Wednesday',
              style: AppStyles.s15w400.copyWith(
                color: AppColors.gray600,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.error,
                ),
                SizedBox(width: 9),
                Text(
                  'Present',
                  style: AppStyles.s15w500,
                )
              ],
            ),
            const SizedBox(width: 42),
            Row(
              children: const [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.error,
                ),
                SizedBox(width: 9),
                Text(
                  'Present',
                  style: AppStyles.s15w500,
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}


class HeaderBody extends StatelessWidget {
  const HeaderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'April 12, 2023',
              style: AppStyles.s18w500,
            ),
            Text(
              'Wednesday',
              style: AppStyles.s15w400.copyWith(
                color: AppColors.gray600,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.error,
                ),
                SizedBox(width: 9),
                Text(
                  'Present',
                  style: AppStyles.s15w500,
                )
              ],
            ),
            const SizedBox(width: 42),
            Row(
              children: const [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.error,
                ),
                SizedBox(width: 9),
                Text(
                  'Present',
                  style: AppStyles.s15w500,
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}

