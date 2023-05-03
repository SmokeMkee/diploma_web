import 'package:diploma_web/student/src/features/schedule/ui/widget/schedule_card.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../localization/generated/l10n.dart';
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
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 200),
            child: HeaderWidget(
              title: S.of(context).schedule,
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
                tabs: [
                  Tab(
                    text: S.of(context).monday,
                  ),
                  Tab(
                    text: S.of(context).tuesday,
                  ),
                  Tab(
                    text: S.of(context).wednesday,
                  ),
                  Tab(
                    text: S.of(context).thursday,
                  ),
                  Tab(
                    text: S.of(context).friday,
                  ),
                  Tab(
                    text: S.of(context).saturday,
                  ),
                  Tab(
                    text: S.of(context).sunday,
                  ),
                ],
              ),
              const Divider(),
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
    return Column(
      children: [
        const HeaderBody(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return Row(
                    children: [
                      Text('${index + 7}:00'),
                      const SizedBox(width: 30),
                      const Expanded(child: ScheduleCard()),
                    ],
                  );
                } else {
                  return Row(
                    children:  [
                      Text('${index + 7}:00'),
                      const SizedBox(width: 30),
                     // const Divider(thickness: 13,height: 22, color: Colors.purple,),
                    ],
                  );
                }
              },
              itemCount: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class HeaderBody extends StatelessWidget {
  const HeaderBody({Key? key}) : super(key: key);

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
              S.of(context).april122023,
              style: AppStyles.s18w500,
            ),
            Text(
              S.of(context).wednesday,
              style: AppStyles.s15w400.copyWith(
                color: AppColors.gray600,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: AppColors.error,
                ),
                SizedBox(width: 9),
                Text(
                  S.of(context).absent,
                  style: AppStyles.s15w500,
                )
              ],
            ),
            const SizedBox(width: 42),
            Row(
              children: [
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: AppColors.success,
                ),
                SizedBox(width: 9),
                Text(
                  S.of(context).present,
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
