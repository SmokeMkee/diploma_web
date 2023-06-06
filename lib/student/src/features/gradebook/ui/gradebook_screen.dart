import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/student/src/features/gradebook/ui/widgets/gradebook_card.dart';
import 'package:diploma_web/student/src/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../courses/data/bloc/courses_bloc.dart';
import '../../localization/generated/l10n.dart';
import '../../navigation/app_router/app_router.dart';
import '../../profile/ui/profile_screen.dart';

class GradeBookScreen extends StatefulWidget {
  const GradeBookScreen({Key? key}) : super(key: key);

  @override
  State<GradeBookScreen> createState() => _GradeBookScreenState();
}

class _GradeBookScreenState extends State<GradeBookScreen> {
  @override
  void initState() {
    context.read<CoursesBloc>().add(FetchCoursesEvent());
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
            title: S.of(context).gradeBook,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 34),
            Expanded(
              child: BlocBuilder<CoursesBloc, CoursesState>(
                builder: (context, state) {
                  if (state is CoursesData) {
                    return ListView.builder(
                      itemBuilder: (context, int index) {
                        return GestureDetector(
                          onTap: () => context.router.navigate(
                            GradeBookDetailedRoute(
                              courseId: state.listCourses[index].courseId ?? 0,
                              teacherName:
                                  state.listCourses[index].email ?? 'no info',
                              courseName: state.listCourses[index].courseName ??
                                  'no info',
                            ),
                          ),
                          child: GradeBookCard(
                            courseName: state.listCourses[index].courseName ??
                                'no info',
                            teacherName:
                                state.listCourses[index].email ?? 'no info',
                          ),
                        );
                      },
                      itemCount: state.listCourses.length,
                    );
                  }
                  if (state is CoursesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CoursesError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return EmptyWidget(
                    imageAssetPath: AppAssets.images.emptyCourses,
                    text: 'You don’t have any courses yet',
                  );
                },
              ),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
