import 'package:flutter/material.dart';
import 'package:spotify/common/components/app_dimensions.dart';
import 'package:spotify/common/components/app_textstyle.dart';
import 'package:spotify/core/config/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.width,
    this.height = 40,
    this.borderRadius = 20,
    this.backgroundColor,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  final double? width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? AppDimensions.deviceWidth(context) * 0.8,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.bold(
              fontSize: 22, color: textColor ?? AppColors.lightText),
        ),
      ),
    );
  }
}
