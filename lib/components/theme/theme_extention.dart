import 'package:flutter/material.dart';
import 'package:quiknote/components/theme/theme.dart';

extension ThemeExtensions on BuildContext {
  // دسترسی به ThemeData اصلی
  ThemeData get theme => Theme.of(this);

  // دسترسی به CustomColors
  CustomColors get colors => theme.extension<CustomColors>()!;

  // دسترسی به حالت تم (روشن یا تاریک)
  bool get isDarkMode => theme.brightness == Brightness.dark;

  // دسترسی سریع به رنگ‌های اصلی و فرعی
  Color get primaryColor => theme.primaryColor;
  Color get secondaryColor => theme.colorScheme.secondary;

  // دسترسی به رنگ پس‌زمینه
  Color get backgroundColor => theme.scaffoldBackgroundColor;

  // دسترسی به AppBarTheme
  AppBarTheme get appBarTheme => theme.appBarTheme;

  // رنگ متن
  Color get textColor => colors.text ?? Colors.black;

  // سایر رنگ‌ها از CustomColors
  Color get positiveColor => colors.positive ?? Colors.green;
  Color get negativeColor => colors.negative ?? Colors.red;
  Color get warningColor => colors.warning ?? Colors.orange;
  Color get disableColor => colors.disable ?? Colors.grey;
  Color get dividerColor => colors.divider ?? Colors.grey;
}

extension SizeExtensions on BuildContext {
  // اندازه‌های مختلف برای فونت‌ها
  double get fontSizeMini => 10.0;
  double get fontSizeSmall => 12.0;
  double get fontSizeMedium => 16.0;
  double get fontSizeLarge => 20.0;
  double get fontSizeExtraLarge => 24.0;
  double get fontSizeHuge => 30.0;

  // اندازه‌های مختلف برای فاصله‌ها (برای استفاده در SizedBox یا Padding)
  double get spaceMini => 4.0;
  double get spaceSmall => 8.0;
  double get spaceMedium => 16.0;
  double get spaceLarge => 24.0;
  double get spaceExtraLarge => 32.0;
  double get spaceHuge => 40.0;

  // تعریف مستقیم SizedBox برای استفاده راحت‌تر در کد
  SizedBox get miniSpaceBox => SizedBox(height: spaceMini);
  SizedBox get smallSpaceBox => SizedBox(height: spaceSmall);
  SizedBox get mediumSpaceBox => SizedBox(height: spaceMedium);
  SizedBox get largeSpaceBox => SizedBox(height: spaceLarge);
  SizedBox get extraLargeSpaceBox => SizedBox(height: spaceExtraLarge);
  SizedBox get hugeSpaceBox => SizedBox(height: spaceHuge);
}

extension ScreenSizeExtension on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 600;

  bool get isTablet =>
      MediaQuery.of(this).size.width >= 600 &&
      MediaQuery.of(this).size.width < 1024;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024;
}
