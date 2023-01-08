import 'package:flutter/material.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';
import 'shared/constants.dart';
import 'shared/utils/page_not_found.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      title: "PPSW",
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.promptTextTheme(),
        primaryColor: primaryColor,
        primaryColorDark: primaryLightColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: accentColor,
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: primaryColor,
        ),
      ),
      unknownRoute: GetPage(
        name: "/not-found",
        page: () => const PageNotFound(),
        transition: Transition.noTransition,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: const Locale('th', 'TH'),
      fallbackLocale: const Locale('th', 'TH'),
    );
  }
}
