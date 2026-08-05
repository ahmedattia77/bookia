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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  bool isPasswordObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    userNameController.dispose();
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
                controller: userNameController,
                textInputType: TextInputType.text,
                textHint: LocaleKeys.userName.tr(),
              ),

              SizedBox(height: 16.h),

              CustomTextFormField(
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                textHint: LocaleKeys.Email.tr(),
              ),
              SizedBox(height: 16.h),

              CustomTextFormField(
                controller: passwordController,
                textInputType: TextInputType.text,
                textHint: LocaleKeys.password.tr(),
                isPassword: true,
              ),
              SizedBox(height: 16.h),

              CustomTextFormField(
                controller: rePasswordController,
                textInputType: TextInputType.text,
                textHint: LocaleKeys.confirmPassword.tr(),
                isPassword: true,
              ),

              SizedBox(height: 25.h),

              CustomButtonWidget(
                text: LocaleKeys.login.tr(),
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
                onPressed: () {},
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
                      LocaleKeys.registerNow.tr(),
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
