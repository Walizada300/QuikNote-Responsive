import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class BText extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? height;
  final TextOverflow? overflow;
  final int? maxLines;

  const BText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    Locales.currentLocale(context);
    String isDari = context.currentLocale.toString();
    return LocaleText(
      text!,
      textAlign: textAlign ?? TextAlign.center,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: isDari == 'en' ? 'poppin' : 'bfont',
        height: height,
      ),
    );
  }
}

class BTextSimple extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? height;
  final TextOverflow? overflow;
  final int? maxLines;
  const BTextSimple({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    Locales.currentLocale(context);
    String isDari = context.currentLocale.toString();
    return Text(
      text ?? "text",
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: isDari == 'en' ? 'poppin' : 'bfont',
        height: height,
      ),
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
