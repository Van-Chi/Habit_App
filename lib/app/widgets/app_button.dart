import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPress,
    this.backgroundColor,
    this.foregroundColor,
    this.content,
  });

  final Function()? onPress;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
          backgroundColor: backgroundColor??const Color(0xffFDA758),
          foregroundColor: foregroundColor??const Color(0xff573353),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
      onPressed: onPress ?? () {},
      child: content,
    );
  }
}
