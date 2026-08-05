import 'package:bookia/common_widgets/custom_button_widget.dart';
import 'package:bookia/core/app_color.dart';
import 'package:bookia/features/athu/presentation/widgets/customTextFromField.dart';
import 'package:bookia/features/athu/presentation/widgets/custom_back_button.dart';
import 'package:bookia/features/athu/presentation/widgets/social_button_widget.dart';
import 'package:bookia/features/athu/presentation/widgets/social_divider_widget.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),

              const CustomBackButton(),

              SizedBox(height: 28.h),

              Text(
                LocaleKeys.loginHeadTitle.tr(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),

              SizedBox(height: 32.h),

              CustomTextFormField(
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                textHint: LocaleKeys.enterEmial.tr(),
              ),

              SizedBox(height: 15.h),

              CustomTextFormField(
                controller: passwordController,
                textInputType: TextInputType.text,
                textHint: LocaleKeys.enterPassword.tr(),
                isPassword: true,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.forgetPassword.tr(),
                    style: TextStyle(
                      color: const Color(0xFF6A707C),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              CustomButtonWidget(
                text: LocaleKeys.login.tr(),
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
                onPressed: () {},
              ),

              SizedBox(height: 30.h),

              const SocialDividerWidget(),

              SizedBox(height: 20.h),

              SocialButtonWidget(
                icon: const Icon(
                  Icons.g_mobiledata_rounded,
                  size: 30,
                  color: AppColors.red,
                ),
                label: LocaleKeys.signInWithGoogle.tr(),
                onTap: () {},
              ),

              SizedBox(height: 12.h),

              SocialButtonWidget(
                icon: Icon(
                  Icons.apple,
                  size: 24,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.white
                      : AppColors.black,
                ),
                label: LocaleKeys.signInWithApple.tr(),
                onTap: () {},
              ),

              SizedBox(height: 35.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.dontHaveAccount.tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  GestureDetector(
                    onTap: () {
                      // TODO: Navigate to Register Screen
                    },
                    child: Text(
                      LocaleKeys.login.tr(),
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
