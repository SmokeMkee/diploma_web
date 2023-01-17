import 'package:diploma_web/src/features/assignments/ui/widgets/assignment_card.dart';
import 'package:diploma_web/src/widgets/app_filter_buttun.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_drop_down_button.dart';
import '../../profile/ui/profile_screen.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(72, 42, 72, 0),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 200),
          child: HeaderWidget(
            title: 'assignments',
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(width: 50),
            Row(
              children: const [
                SizedBox(width: 350, child: AppDropDownButton()),
                SizedBox(width: 23),
                AppFilterButton(),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, int index) {
                  return const AssignmentsCard();
                },
                itemCount: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
