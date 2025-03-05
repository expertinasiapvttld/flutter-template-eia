import 'package:flutter/material.dart';
import 'package:happy_grocers/utils/app_styles.dart';

class HGText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  const HGText(this.text, {super.key, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ?? AppStyles.montserratStyle,
    );
  }
}
