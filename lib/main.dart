import 'package:diploma_web/src/features/init/dependencies_provider/dependencies_provider.dart';
import 'package:diploma_web/src/features/localization/generated/l10n.dart';
import 'package:diploma_web/src/features/localization/i_locale_repo.dart';
import 'package:diploma_web/src/features/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/features/auth/sign_in/ui/authorization_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DependenciesProvider(
      builder: (context) {
        return ValueListenableBuilder<Locale>(
          valueListenable: context.read<ILocaleRepo>().locale,
          builder: (context, locale, _) {
            return MaterialApp(
              title: 'SimpleEducation',
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              locale: locale,
              supportedLocales: S.delegate.supportedLocales,
              home: const Navigation(),
            );
          },
        );
      },
    );
  }
}
