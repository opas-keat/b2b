library persistent_auth;

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nhost_flutter_graphql/nhost_flutter_graphql.dart';

import 'app/routes/app_pages.dart';
import 'app/shared/constants.dart';
import 'app/shared/page_not_found.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  nhostClient = NhostClient(backendUrl: backendUrl);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NhostGraphQLProvider(
      nhostClient: nhostClient,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.noTransition,
        title: "PPSW ADMIN",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        locale: const Locale('th', 'TH'),
        fallbackLocale: const Locale('th', 'TH'),
        unknownRoute: GetPage(
          name: "/not-found",
          page: () => const PageNotFound(),
          transition: Transition.noTransition,
        ),
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
      ),
    );
  }
}
