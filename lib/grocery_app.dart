import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happy_grocers/utils/localization/application.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:happy_grocers/router/hg_router.dart';
import 'package:happy_grocers/utils/hg_scroll_behaviour.dart';
import 'package:happy_grocers/utils/localization/app_language.dart';
import 'package:happy_grocers/utils/localization/app_translations_delegate.dart';

class GroceryApp extends StatelessWidget {
  final AppLanguage appLanguage;
  const GroceryApp(this.appLanguage, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<AppLanguage>(create: (_) => appLanguage),
          // StreamProvider<bool>(
          //   create: (_) => InternetService().connectivityStream,
          //   initialData: true,
          // ),
        ],
        child: Consumer<AppLanguage>(
          builder: (context, languageNotifier, child) {
            return FlutterSizer(
              builder: (context, orientation, screenType) {
                return MaterialApp.router(
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                    textTheme: GoogleFonts.montserratTextTheme(),
                    pageTransitionsTheme: const PageTransitionsTheme(
                      builders: {
                        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
                        TargetPlatform.android:
                            FadeUpwardsPageTransitionsBuilder(),
                        TargetPlatform.macOS:
                            FadeUpwardsPageTransitionsBuilder(),
                        TargetPlatform.windows:
                            FadeUpwardsPageTransitionsBuilder(),
                        TargetPlatform.linux:
                            FadeUpwardsPageTransitionsBuilder(),
                      },
                    ),
                  ),
                  color: Colors.white,
                  locale: languageNotifier.appLocal,
                  debugShowCheckedModeBanner: false,
                  title: 'Happy Grocers',
                  supportedLocales: Application.supportedLocale,
                  localizationsDelegates: const [
                    AppTranslationsDelegate(),
                    // GlobalCupertinoLocalizations.delegate,
                    DefaultCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    RefreshLocalizations.delegate,
                  ],
                  scrollBehavior: HGScrollBehaviour().copyWith(
                    scrollbars: false,
                  ),
                  routerConfig: HGRouter.getRouter(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
