import 'package:bookia/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialDividerWidget extends StatelessWidget {
  const SocialDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            LocaleKeys.orLoginWith.tr(),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
