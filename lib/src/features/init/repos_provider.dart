import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../localization/locale_repo.dart';

class ReposProvider extends StatelessWidget {
  const ReposProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [

        RepositoryProvider<ILocaleRepo>(
          create: (context) => LocaleRepo(),
        ),
      ],
      child: child,
    );
  }
}
