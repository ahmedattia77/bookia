import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/core/services/local_storage_service.dart';
import 'package:bookia/core/services/service_locator.dart';
import 'package:bookia/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocalStorageService.init();
  setupServiceLocator();
  final bool isLoggedIn = LocalStorageService.isUserLoggedIn();
  final String initialRoute = isLoggedIn
      ? Routes.homeScreenRoute
      : Routes.welcomeScreenRoute;

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar'), Locale('en')],
      path: 'assets/translation',
      fallbackLocale: Locale('en'),
      startLocale: const Locale('en'),
      child: MyApp(initialRoute: initialRoute),
    ),
  );
}
