import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: "assets/translations",
      supportedLocales: [
        Locale("ar"),
        Locale("en"),
      ],
      fallbackLocale: Locale("en"),
      assetLoader: CodegenLoader(),
      saveLocale: true,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
