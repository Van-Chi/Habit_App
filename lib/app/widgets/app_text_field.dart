import 'package:flutter/material.dart';
import 'package:habit_app/app/utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.textStyle,
    this.enabledBorderColor,
    this.fillColor,
    this.filled,
    this.prefixIcon,
    this.suffixIcon,
    this.focusedBorderColor,
    this.hintText,
    this.borderRadius,
    this.prefixIconColor,
    this.obscureText,
    this.clickSuffixIcon,
  });

  final TextStyle? textStyle;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? fillColor;
  final bool? filled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final BorderRadius? borderRadius;
  final Color? prefixIconColor;
  final bool? obscureText;
  final Function()? clickSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      style: textStyle,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: focusedBorderColor ?? AppColors.orangeOpacity),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: enabledBorderColor ?? AppColors.orangeOpacity),
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
        filled: filled,
        fillColor: fillColor,
        hintText: hintText,
        prefixIcon: SizedBox(
          width: 15,
          height: 12,
          child: prefixIcon,
        ),
        suffixIcon: SizedBox(
          width: 15,
          height: 12,
          child: IconButton(
            onPressed: clickSuffixIcon ?? () {},
            color: prefixIconColor,
            icon: suffixIcon ?? const Text(''),
          ),
        ),
      ),
    );
  }
}
