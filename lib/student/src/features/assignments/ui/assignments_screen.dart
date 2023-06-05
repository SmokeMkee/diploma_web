import 'package:auto_route/auto_route.dart';
import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/student/src/features/assignments/ui/widgets/assignment_card.dart';
import 'package:diploma_web/student/src/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/app_drop_down_button.dart';
import '../../../widgets/app_filter_buttun.dart';
import '../../courses/courses_detailed_lesson/ui/lesson.dart';
import '../../localization/generated/l10n.dart';
import '../../navigation/app_router/app_router.dart';
import '../../profile/ui/profile_screen.dart';
import '../data/bloc/assignments_bloc.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 200),
          child: HeaderWidget(
            title: S.of(context).assignments,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(width: 50),
            Row(
              children: [
                SizedBox(
                  width: 350,
                  child: AppDropDownButton(
                    items: [
                      DropdownMenuItem(
                        value: S.of(context).almaty,
                        child: Text(
                          S.of(context).almaty,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: S.of(context).almaty,
                        child: Text(
                          S.of(context).almaty,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ],
                    initial: S.of(context).allCourses,
                  ),
                ),
                const SizedBox(width: 23),
                const AppFilterButton(),
              ],
            ),
            const SizedBox(height: 12),
            BlocBuilder<AssignmentsBloc, AssignmentsState>(
              builder: (context, state) {
                if (state is AssignmentsData) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, int index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const CoursesDetailedLesson(),
                            //   ),
                            // );
                          },
                          child: AssignmentsCard(
                            courseName: 'courseName',
                            title: state.listAssignments[index].heading ??
                                ' no info',
                            date: state.listAssignments[index].startDate ??
                                'no info',
                          ),
                        );
                      },
                      itemCount: state.listAssignments.length,
                    ),
                  );
                }
                if (state is AssignmentsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is AssignmentsError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return EmptyWidget(
                    imageAssetPath: AppAssets.images.emptyAssignments,
                    text: 'You don\'t have an assignment yet');
              },
            ),
          ],
        ),
      ),
    );
  }
}
