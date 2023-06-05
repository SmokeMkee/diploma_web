import 'package:flutter/material.dart';

import '../../../constants/app_styles.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget(
      {Key? key, required this.imageAssetPath, required this.text})
      : super(key: key);
  final String imageAssetPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageAssetPath),
          const SizedBox(height: 35),
          Text(
            text,
            style: AppStyles.s20w600,
          )
        ],
      ),
    );
  }
}
