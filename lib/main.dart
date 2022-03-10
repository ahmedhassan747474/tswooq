import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/provider/auth_service.dart';
import 'package:tswooq/routes.dart';
import 'package:tswooq/screens/home/home_screen.dart';
import 'package:tswooq/screens/sign_in/sign_in_screen.dart';
import 'package:tswooq/screens/splash/splash.dart';
import 'package:tswooq/theme.dart';
import 'package:tswooq/translations/codegen_loader.g.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setPathUrlStrategy();
  runApp(
    EasyLocalization(
      path: "assets/translations",
      supportedLocales: [
        Locale("ar"),
        Locale("en"),
      ],
      fallbackLocale: Locale("ar"),
      startLocale: Locale("ar"),
      assetLoader: CodegenLoader(),
      saveLocale: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _getHomeWidget(AuthService authService) {
    if (authService.isAuth) {
      return HomeScreen();
    }
    return FutureBuilder(
      future: authService.autoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Splash();
        }
        return SignInScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
      ],
      child: Consumer<AuthService>(
        builder: (context, auth, _) {
          return MaterialApp(
            scrollBehavior: MyCustomScrollBehavior(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Tswooq',
            theme: theme(),
            home: kIsWeb ? HomeScreen() : _getHomeWidget(auth),
            //    home: VendorsScreen(),
            routes: routes,

            initialRoute: "/",
          );
        },
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
