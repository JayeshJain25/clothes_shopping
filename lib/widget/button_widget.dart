import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import 'text_widget.dart';

class AppButton {
  static primaryButton({
    required void Function()? onButtonPressed,
    required String title,
    double? height,
    Color? bgColor,
    double? width,
    Color? textClr,
  }) {
    return InkWell(
      onTap: onButtonPressed,
      child: Container(
        width: width ?? 1.sw,
        height: height ?? 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.goldColor),
        child: WorkSansTextWidget(
          text: title,
          textSize: 16,
          fontWeight: FontWeight.normal,
          color: textClr ?? AppColors.whiteColor,
        ),
      ),
    );
  }
}
