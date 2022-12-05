import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';
import 'shared/widgets/page_not_found.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
      ),
      unknownRoute: GetPage(
        name: "/not-found",
        page: () => const PageNotFound(),
        transition: Transition.fadeIn,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: const Locale('th', 'TH'),
      fallbackLocale: const Locale('th', 'TH'),
    );
  }
}
