import 'package:bookia/common_widgets/custom_button_widget.dart';
import 'package:bookia/core/app_color.dart';
import 'package:bookia/features/athu/presentation/widgets/language_theme_header.dart';
import 'package:bookia/features/athu/presentation/widgets/welcome_header_widget.dart';
import 'package:bookia/gen/assets.gen.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.black.withValues(alpha: 0.4)
                  : Colors.transparent,
              Theme.of(context).brightness == Brightness.dark
                  ? BlendMode.darken
                  : BlendMode.colorBurn,
            ),
            fit: BoxFit.cover,
            image: Assets.images.welcomeImageBackground.provider(),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              const LanguageAndThemeHeader(),
              SizedBox(height: 30.h),
              WelcomeHeaderWidget(),
              const Spacer(),
              CustomButtonWidget(
                text: LocaleKeys.login.tr(),
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
                onPressed: () {},
              ),

              SizedBox(height: 15.h),

              CustomButtonWidget(
                text: LocaleKeys.register.tr(),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                borderColor: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.white
                    : AppColors.darkText,
                onPressed: () {},
              ),
              SizedBox(height: 85.h),
            ],
          ),
        ),
      ),
    );
  }
}
