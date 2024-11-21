import 'package:flutter/material.dart';
import 'package:quiknote/components/abx_text.dart';

class BButton extends StatelessWidget {
  final String? label;
  final Color? bgColor;
  final Color? labelColor;
  final VoidCallback? onPress;
  final double? width;

  const BButton({
    super.key,
    required this.label,
    this.bgColor,
    this.labelColor,
    required this.onPress,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        child: BText(
          text: label,
          fontSize: 16,
          color: labelColor,
          fontWeight: FontWeight.w500,
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.all(18),
          backgroundColor: bgColor,
          elevation: 10,
          shadowColor: bgColor,
        ),
      ),
    );
  }
}

class BButtonIcon extends StatelessWidget {
  final String? label;
  final Color? bgColor;
  final Color? labelColor;
  final VoidCallback? onPress;
  final Widget? icon;

  const BButtonIcon({
    super.key,
    required this.label,
    this.bgColor,
    this.labelColor,
    required this.onPress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon!,
            SizedBox(width: 7),
            BText(
              text: label,
              fontSize: 16,
              color: labelColor,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.all(18),
          backgroundColor: bgColor,
          elevation: 10,
          shadowColor: bgColor,
        ),
      ),
    );
  }
}
