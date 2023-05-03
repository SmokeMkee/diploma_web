import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/student/src/features/courses/ui/courses_screen.dart';
import 'package:diploma_web/student/src/features/navigation/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/app_styles.dart';
import '../../../../../../student/src/features/profile/ui/profile_screen.dart';
import '../../../../../../student/src/widgets/app_back_button.dart';
import '../../../../../../student/src/widgets/course_container.dart';

class TGradeBookDetailed extends StatelessWidget {
  const TGradeBookDetailed({Key? key}) : super(key: key);

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
              withDisabilities: false,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // AppBackButton(
                  //   onTap: () {
                  //     context.router.popAndPush(const TGradeBookRouter());
                  //   },
                  // ),
                  const SizedBox(width: 34),
                  const CourseContainer(),
                  const SizedBox(width: 24),
                  const Text(
                    'General English',
                    style: AppStyles.s18w500,
                  )
                ],
              ),
              const SizedBox(height: 36),
              const SearchWidget(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      //onTap: () => context.router.push(const TGradeBookDetailedGroupRoute()),
                      child: const TGradeBookDetailedCard(),
                    );
                  },
                  itemCount: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TGradeBookDetailedCard extends StatelessWidget {
  const TGradeBookDetailedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: const [
                  CourseContainer(),
                  SizedBox(width: 18),
                  Text(
                    'ITIS -1914',
                    style: AppStyles.s15w500,
                  ),
                ],
              ),
              SvgPicture.asset(AppAssets.svg.arrowRight2)
            ],
          ),
        ),
      ),
    );
  }
}
