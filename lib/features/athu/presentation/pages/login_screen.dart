import 'package:bookia/core/common_widgets/custom_button_widget.dart';
import 'package:bookia/core/app_color.dart';
import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/features/athu/presentation/cubit/login/login_cubit.dart';
import 'package:bookia/features/athu/presentation/widgets/custom_text_from_field.dart';
import 'package:bookia/features/athu/presentation/widgets/custom_back_button.dart';
import 'package:bookia/features/athu/presentation/widgets/social_button_widget.dart';
import 'package:bookia/features/athu/presentation/widgets/social_divider_widget.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Form(
            key: cubit.formKey,
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
                  controller: cubit.emailController,
                  textInputType: TextInputType.emailAddress,
                  textHint: LocaleKeys.enterEmial.tr(),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return LocaleKeys.enterEmial.tr();
                    }
                    return null;
                  },
                ),

                SizedBox(height: 15.h),

                CustomTextFormField(
                  controller: cubit.passwordController,
                  textInputType: TextInputType.text,
                  textHint: LocaleKeys.enterPassword.tr(),
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocaleKeys.enterPassword.tr();
                    }
                    return null;
                  },
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      LocaleKeys.forgetPassword.tr(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: AppColors.darkText),
                            state.response.message ??
                                LocaleKeys.loginSuccessfully.tr(),
                          ),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                      context.pushNamed(Routes.homeScreenRoute);
                    } else if (state is LoginErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(state.error),
                          backgroundColor: AppColors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    }

                    return CustomButtonWidget(
                      text: LocaleKeys.login.tr(),
                      backgroundColor: AppColors.primary,
                      textColor: AppColors.white,
                      onPressed: () {
                        cubit.login();
                      },
                    );
                  },
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
                        context.pushReplacementNamed(
                          Routes.registerScreenRoute,
                          arguments: (route) => false,
                        );
                      },
                      child: Text(
                        LocaleKeys.register.tr(),
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
      ),
    );
  }
}
