import 'package:flutter/material.dart';
import 'package:happy_grocers/widgets/hg_text.dart';
import 'package:happy_grocers/utils/app_colors.dart';
import 'package:happy_grocers/utils/app_styles.dart';

class HGButton extends StatelessWidget {
  final String text;
  final Color? buttonColor, borderColor;
  final Function()? onPressed;
  final double? borderRadius;
  final double? width, height;

  const HGButton(
    this.text, {
    this.onPressed,
    this.buttonColor,
    this.borderColor,
    this.borderRadius,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.1),
          foregroundColor: MaterialStateProperty.all<Color?>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color?>(
            buttonColor ?? AppColors.buttonColor,
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              width: 1.0,
              color: borderColor ?? AppColors.transparent,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 25),
            ),
          ),
        ),
        child: HGText(
          text,
          style: AppStyles.montserratStyle.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
