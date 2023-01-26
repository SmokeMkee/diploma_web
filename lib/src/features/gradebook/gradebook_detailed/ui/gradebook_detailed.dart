import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../profile/ui/profile_screen.dart';

class GradeBookDetailed extends StatelessWidget {
  const GradeBookDetailed({Key? key}) : super(key: key);

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
              title: 'gradebook > general english',
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
                      text: 'Grades',
                    ),
                    Tab(
                      text: 'Attendance',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Table(
                      border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FixedColumnWidth(64),
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Container(
                              height: 32,
                              color: Colors.green,
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.top,
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              height: 64,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 128,
                              color: Colors.purple,
                            ),
                            Container(
                              height: 32,
                              color: Colors.yellow,
                            ),
                            Center(
                              child: Container(
                                height: 32,
                                width: 32,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ],
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
