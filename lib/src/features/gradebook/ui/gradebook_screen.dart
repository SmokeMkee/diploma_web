import 'package:diploma_web/src/features/gradebook/ui/widgets/gradebook_card.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../navigation/app_router/app_router.dart';
import '../../profile/ui/profile_screen.dart';

class GradeBookScreen extends StatelessWidget {
  const GradeBookScreen({Key? key}) : super(key: key);

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
              title: 'gradebook',
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 34),
              SizedBox(
                width: 340,
                child: TabBar(
                  unselectedLabelColor: AppColors.gray600,
                  indicatorWeight: 6,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: AppColors.accent,
                  labelColor: AppColors.accent,
                  labelStyle: AppStyles.s15w500.copyWith(color: AppColors.accent),
                  tabs: const [
                    Tab(
                      text: 'All courses',
                    ),
                    Tab(
                      text: 'Second courses',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemBuilder: (context, int index) {
                        return GestureDetector(
                            onTap: () {
                              context.router.push(const GradeBookDetailedRoute());
                            },
                            child: const GradeBookCard());
                      },
                      itemCount: 15,
                    ),
                    ListView.builder(
                      itemBuilder: (context, int index) {
                        return GestureDetector(
                            onTap: () => context.router.navigate(const GradeBookDetailedRoute()),
                            child: const GradeBookCard());
                      },
                      itemCount: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}



