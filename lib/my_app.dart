import 'package:bookia/core/theme/app_theme.dart';
import 'package:bookia/core/theme/cubit/theme_cubit.dart';
import 'package:bookia/features/athu/presentation/pages/login_screen.dart';
import 'package:bookia/features/athu/presentation/pages/register_screen.dart';
import 'package:bookia/features/athu/presentation/pages/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 546),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => ThemeCubit(),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                // theme: context.read<ThemeCubit>().theme,
                theme: AppTheme.darkMode,
                debugShowCheckedModeBanner: false,
                home: RegisterScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
