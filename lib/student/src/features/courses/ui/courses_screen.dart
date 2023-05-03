import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/student/src/features/courses/ui/widget/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../widgets/app_filter_buttun.dart';
import '../../../widgets/app_text_form_field.dart';
import '../../navigation/app_router/app_router.dart';
import '../../profile/ui/profile_screen.dart';
import '../data/bloc/courses_bloc.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 200),
          child: HeaderWidget(
            title: 'Courses',
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(width: 30),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchWidget(),
                  const SizedBox(height: 53),
                  const Divider(
                    height: 4,
                    thickness: 2,
                    color: AppColors.gray200,
                  ),
                  const SizedBox(height: 40),
                  BlocBuilder<CoursesBloc, CoursesState>(
                    builder: (context, state) {
                      if (state is CoursesData) {
                        return Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 21,
                              mainAxisSpacing: 35,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => context.router
                                    .navigate(const CoursesDetailedRoute()),
                                child: CourseCard(
                                  courses: state.listCourses[index],
                                ),
                              );
                            },
                            itemCount: state.listCourses.length,
                          ),
                        );
                      }
                      if (state is CoursesLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 350,
          child: AppTextFormField(
            hintText: 'search',
            hintStyle: AppStyles.s14w500.copyWith(color: AppColors.gray400),
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: SvgPicture.asset(
                AppAssets.svg.search,
                color: AppColors.gray200,
              ),
            ),
          ),
        ),
        const SizedBox(width: 23),
        const AppFilterButton(),
      ],
    );
  }
}
