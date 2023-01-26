import 'package:diploma_web/src/features/init/dependencies_provider/dependencies_provider.dart';
import 'package:diploma_web/src/features/localization/generated/l10n.dart';
import 'package:diploma_web/src/features/localization/i_locale_repo.dart';
import 'package:diploma_web/src/features/navigation/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();
final router = AppRouter();
void main() {
  return runApp(
    DependenciesProvider(
      builder: (context) {

        return ValueListenableBuilder<Locale>(
          valueListenable: context.read<ILocaleRepo>().locale,
          builder: (context, locale, _) {
            return MaterialApp.router(
              routerDelegate: router.delegate(),
              routeInformationParser: router.defaultRouteParser(),
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
            );
          },
        );
      },
    ),
  );
}
