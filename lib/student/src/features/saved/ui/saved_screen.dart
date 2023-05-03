import 'package:diploma_web/constants/app_assets.dart';
import 'package:diploma_web/constants/app_colors.dart';
import 'package:diploma_web/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../courses/ui/courses_screen.dart';
import '../../localization/generated/l10n.dart';
import '../../profile/ui/profile_screen.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 200),
          child: HeaderWidget(
            title: S.of(context).courses,
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
                children: const [
                  SearchWidget(),
                  SizedBox(height: 53),
                  TableWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TableWidget extends StatelessWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(42, 13, 11, 13),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.gray200,
          ),
        ),
        child: ListView(
          children: [
            DataTable(
              dataTextStyle: AppStyles.s15w500.copyWith(color: AppColors.gray600),
              columns: [
                DataColumn(label: Text(S.of(context).material, style: AppStyles.s15w500.copyWith(color: AppColors.gray600))),
                DataColumn(label: Text(S.of(context).courseName, style: AppStyles.s15w500.copyWith(color: AppColors.gray600))),
                DataColumn(label: Text(S.of(context).subCourse, style: AppStyles.s15w500.copyWith(color: AppColors.gray600))),
                DataColumn(
                  label: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          S.of(context).clearAll,
                          style: AppStyles.s15w500.copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              rows:  [
                DataRow(cells: [
                  const DataCell(Text('Present Perfect', style: AppStyles.s15w500)),
                  const DataCell(Text('General English', style: AppStyles.s15w500)),
                  const DataCell(Text('Week 1', style: AppStyles.s15w500)),
                  DataCell(Center(child: SvgPicture.asset(AppAssets.svg.reversedDots))),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Web Development. Lecture 1', style: AppStyles.s15w500)),
                  const DataCell(Text('Web Development', style: AppStyles.s15w500)),
                  const DataCell(Text('Week 5', style: AppStyles.s15w500)),
                  DataCell(Center(child: SvgPicture.asset(AppAssets.svg.reversedDots))),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Present Perfect', style: AppStyles.s15w500)),
                  const DataCell(Text('UI/UX Design', style: AppStyles.s15w500)),
                  const DataCell(Text('Week 9', style: AppStyles.s15w500)),
                  DataCell(Center(child: SvgPicture.asset(AppAssets.svg.reversedDots))),
                ]),
                DataRow(cells: [
                  const DataCell(
                    Text('Web Development. Lecture 1', style: AppStyles.s15w500),
                  ),
                  const DataCell(Text('General English', style: AppStyles.s15w500)),
                  const DataCell(Text('Week 3', style: AppStyles.s15w500)),
                  DataCell(Center(child: SvgPicture.asset(AppAssets.svg.reversedDots))),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Present Perfect', style: AppStyles.s15w500)),
                  const DataCell(Text('General English', style: AppStyles.s15w500)),
                  const DataCell(Text('Week 1', style: AppStyles.s15w500)),
                  DataCell(Center(child: SvgPicture.asset(AppAssets.svg.reversedDots))),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Web Development. Lecture 1', style: AppStyles.s15w500)),
                  const DataCell(Text('Web Development', style: AppStyles.s15w500)),
                  const DataCell(Text('Week 5', style: AppStyles.s15w500)),
                  DataCell(Center(child: SvgPicture.asset(AppAssets.svg.reversedDots))),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Present Perfect', style: AppStyles.s15w500)),
                  const DataCell(Text('UI/UX Design', style: AppStyles.s15w500)),
                  const DataCell(Text('Week 9', style: AppStyles.s15w500)),
                  DataCell(Center(child: SvgPicture.asset(AppAssets.svg.reversedDots))),
                ]),
                DataRow(cells: [
                  const DataCell(
                    Text('Web Development. Lecture 1', style: AppStyles.s15w500),
                  ),
                  const DataCell(Text('General English', style: AppStyles.s15w500)),
                  const DataCell(Text('Week 3', style: AppStyles.s15w500)),
                  DataCell(Center(child: SvgPicture.asset(AppAssets.svg.reversedDots))),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Present Perfect', style: AppStyles.s15w500)),
                  const DataCell(Text('General English', style: AppStyles.s15w500)),
                  const DataCell(Text('Week 1', style: AppStyles.s15w500)),
                  DataCell(Center(child: SvgPicture.asset(AppAssets.svg.reversedDots))),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Web Development. Lecture 1', style: AppStyles.s15w500)),
                  const DataCell(Text('Web Development', style: AppStyles.s15w500)),
                  const DataCell(Text('Week 5', style: AppStyles.s15w500)),
                  DataCell(Center(child: SvgPicture.asset(AppAssets.svg.reversedDots))),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Present Perfect', style: AppStyles.s15w500)),
                  const DataCell(Text('UI/UX Design', style: AppStyles.s15w500)),
                  const DataCell(Text('Week 9', style: AppStyles.s15w500)),
                  DataCell(Center(child: SvgPicture.asset(AppAssets.svg.reversedDots))),
                ]),
                DataRow(cells: [
                  const DataCell(
                    Text('Web Development. Lecture 1', style: AppStyles.s15w500),
                  ),
                  const DataCell(Text('General English', style: AppStyles.s15w500)),
                  const DataCell(Text('Week 3', style: AppStyles.s15w500)),
                  DataCell(Center(child: SvgPicture.asset(AppAssets.svg.reversedDots))),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TableText extends StatelessWidget {
  const TableText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 44),
      child: Text(
        text,
        style: AppStyles.s15w500,
      ),
    );
  }
}
