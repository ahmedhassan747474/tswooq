import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/routes.dart';
import 'package:tswooq/screens/home/home_screen.dart';
import 'package:tswooq/theme.dart';
import 'package:tswooq/translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: "assets/translations",
      supportedLocales: [
        Locale("ar"),
        Locale("en"),
      ],
      fallbackLocale: Locale("ar"),
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
      title: 'Tswooq',
      theme: theme(),
      home: HomeScreen(),
      routes: routes,
    );
  }
}
