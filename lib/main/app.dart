import 'package:diabetes/home/home_page.dart';
import 'package:diabetes/main/dark_light_controller.dart';
import 'package:diabetes/main/localizations_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    Widget? widget,
  )? appBulder ;
  const MyApp({
    Key? key, this.appBulder,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
          child: Consumer(builder: (context, ref, _) {
        final themeMode = ref.watch(darkModeProvider);
        final localizations = ref.watch(localizationsProvider);
        return MaterialApp(
          restorationScopeId: 'app',
          navigatorKey:  navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: localizations != null ? Locale(localizations, '') : null,
          supportedLocales: LocalizationsController.supported,
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: themeMode,
          home: const HomePage(),
           builder: appBulder,
        );
      }),
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey =GlobalKey<NavigatorState>() ; 
