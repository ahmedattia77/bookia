import 'package:bookia/core/app_color.dart';
import 'package:bookia/core/common_widgets/custom_button_widget.dart';
import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/features/athu/presentation/cubit/register/register_cubit.dart';
import 'package:bookia/features/athu/presentation/widgets/custom_back_button.dart';
import 'package:bookia/features/athu/presentation/widgets/custom_text_from_field.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

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
                  LocaleKeys.register.tr(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),

                SizedBox(height: 32.h),

                CustomTextFormField(
                  controller: cubit.nameController,
                  textInputType: TextInputType.name,
                  textHint: LocaleKeys.userName.tr(),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return LocaleKeys.userName.tr();
                    }
                    return null;
                  },
                ),

                SizedBox(height: 15.h),

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

                SizedBox(height: 15.h),

                CustomTextFormField(
                  controller: cubit.passwordConfirmationController,
                  textInputType: TextInputType.text,
                  textHint: LocaleKeys.confirmPassword.tr(),
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocaleKeys.confirmPassword.tr();
                    }
                    if (value != cubit.passwordController.text) {
                      return LocaleKeys.confirmPassword.tr();
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30.h),

                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccessState) {
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
                      context.pushReplacementNamed(
                        Routes.loginScreenRoute,
                        arguments: (route) => false,
                      );
                    } else if (state is RegisterErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          content: Text(state.error),
                          backgroundColor: AppColors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    }

                    return CustomButtonWidget(
                      text: LocaleKeys.register.tr(),
                      backgroundColor: AppColors.primary,
                      textColor: AppColors.white,
                      onPressed: () {
                        cubit.register();
                      },
                    );
                  },
                ),

                SizedBox(height: 35.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.haveAccount.tr(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.loginScreenRoute);
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
      ),
    );
  }
}
