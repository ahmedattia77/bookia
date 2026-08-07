import 'package:bookia/core/services/local_storage_service.dart';
import 'package:bookia/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocalStorageService.init();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar'), Locale('en')],
      path: 'assets/translation',
      fallbackLocale: Locale('en'),
      startLocale: const Locale('en'),
      child: MyApp(),
    ),
  );
}
