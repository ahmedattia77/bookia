import 'package:bookia/core/app_color.dart';
import 'package:bookia/core/theme/app_theme.dart';
import 'package:bookia/core/theme/cubit/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageAndThemeHeader extends StatefulWidget {
  const LanguageAndThemeHeader({super.key});

  @override
  State<LanguageAndThemeHeader> createState() => _LanguageAndThemeHeaderState();
}

class _LanguageAndThemeHeaderState extends State<LanguageAndThemeHeader> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.locale.languageCode == 'ar';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if (isArabic) {
                context.setLocale(const Locale('en'));
              } else {
                context.setLocale(const Locale('ar'));
              }
            },
            borderRadius: BorderRadius.circular(20.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              child: Row(
                children: [
                  Icon(
                    Icons.language,
                    size: 18,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    isArabic ? 'عربي' : 'English',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),

          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Row(
                children: [
                  Icon(
                    isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    size: 22,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  SizedBox(width: 2.w),
                  Transform.scale(
                    scale: 0.8,
                    child: Switch.adaptive(
                      value:
                          context.read<ThemeCubit>().themeData ==
                          AppTheme.darkMode,
                      activeThumbColor: AppColors.white.withAlpha(100),
                      inactiveThumbColor: Theme.of(context).iconTheme.color,
                      onChanged: (value) {
                        context.read<ThemeCubit>().changeMode();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
