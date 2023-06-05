import 'package:flutter/material.dart';

import '../../../../../../../constants/app_styles.dart';
import '../../../../../widgets/app_text_field.dart';

class OpenQuestionMaterial extends StatelessWidget {
  const OpenQuestionMaterial({Key? key, required this.question})
      : super(key: key);
  final String question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: AppStyles.s11w400.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 9),
          const AppTextField(
            hintText: 'Write your answer',
          )
        ],
      ),
    );
  }
}
