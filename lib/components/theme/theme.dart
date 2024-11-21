import 'package:flutter/material.dart';

// تم روشن
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF0155B6), // رنگ اصلی
  scaffoldBackgroundColor: const Color(0xFFFFFFFF), // پس‌زمینه
  appBarTheme: const AppBarTheme(
    color: Color(0xFF0155B6), // رنگ نوار بالا
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0155B6),
    secondary: Color(0xFF000000), // جایگزین accentColor
    surface: Color(0xFFEEEEEE), // سطح (surface)
    background: Color(0xFFFFFFFF), // پس‌زمینه
    error: Color(0xFFF44336), // رنگ خطا
    onPrimary: Colors.white, // متن روی رنگ اصلی
    onSecondary: Colors.white, // متن روی رنگ ثانویه
  ),
  extensions: const [CustomColors.light], // رنگ‌های سفارشی
);

// تم تاریک
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF0155B6), // رنگ اصلی
  scaffoldBackgroundColor: const Color(0xFF121212), // پس‌زمینه
  appBarTheme: const AppBarTheme(
    color: Color(0xFF0155B6), // رنگ نوار بالا
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF0155B6),
    secondary: Color.fromARGB(255, 255, 255, 255), // جایگزین accentColor
    surface: Color.fromARGB(255, 22, 32, 39), // سطح (surface)
    background: Color(0xFF0D1317), // پس‌زمینه
    error: Color(0xFFFF9090), // رنگ خطا
    onPrimary: Colors.black, // متن روی رنگ اصلی
    onSecondary: Colors.black, // متن روی رنگ ثانویه
  ),
  extensions: const [CustomColors.dark], // رنگ‌های سفارشی
);

// تعریف رنگ‌های سفارشی برای تم روشن و تاریک
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? primaryDark;
  final Color? positive;
  final Color? negative;
  final Color? warning;
  final Color? text;
  final Color? disable;
  final Color? disableLight;
  final Color? ok;
  final Color? divider;

  const CustomColors({
    required this.primaryDark,
    required this.positive,
    required this.negative,
    required this.warning,
    required this.text,
    required this.disable,
    required this.disableLight,
    required this.divider,
    required this.ok,
  });

  // رنگ‌های تم روشن
  static const light = CustomColors(
    primaryDark: Color(0xFF003B7E),
    positive: Color(0xFF4CAF50), // رنگ مثبت
    negative: Color(0xFFF44336), // رنگ منفی
    warning: Color(0xFFFF7417), // رنگ هشدار
    text: Color(0xFF1C1C1C), // رنگ اضافی ۱
    disable: Color(0xff7C7C7C), // رنگ اضافی ۲
    disableLight: Color.fromARGB(255, 228, 228, 228), // رنگ اضافی ۳
    divider: Color(0xFFE2E2E2), // رنگ اضافی ۴
    ok: Color(0xFF1663F5), // رنگ اضافی ۵
  );

  // رنگ‌های تم تاریک
  static const dark = CustomColors(
    primaryDark: Color(0xFF003B7E),
    positive: Color(0xFF81C784), // رنگ مثبت
    negative: Color(0xFFFF9090), // رنگ منفی
    warning: Color(0xFFFFAD76), // رنگ هشدار
    text: Color(0xFFFFFFFF), // رنگ اضافی ۱
    disable: Color(0xFFABABAB), // رنگ اضافی ۲
    disableLight: Color.fromARGB(255, 40, 40, 40), // رنگ اضافی ۳
    divider: Color(0xFF202020), // رنگ اضافی ۴
    ok: Color(0xFF8A91F7), // رنگ اضافی ۵
  );

  @override
  CustomColors copyWith({
    Color? primaryDark,
    Color? positive,
    Color? negative,
    Color? warning,
    Color? text,
    Color? disable,
    Color? disableLight,
    Color? divider,
    Color? ok,
  }) {
    return CustomColors(
      primaryDark: primaryDark ?? this.primaryDark,
      positive: positive ?? this.positive,
      negative: negative ?? this.negative,
      warning: warning ?? this.warning,
      text: text ?? this.text,
      disable: disable ?? this.disable,
      disableLight: disableLight ?? this.disableLight,
      divider: divider ?? this.divider,
      ok: ok ?? this.ok,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t),
      positive: Color.lerp(positive, other.positive, t),
      negative: Color.lerp(negative, other.negative, t),
      warning: Color.lerp(warning, other.warning, t),
      text: Color.lerp(text, other.text, t),
      disable: Color.lerp(disable, other.disable, t),
      disableLight: Color.lerp(disableLight, other.disableLight, t),
      divider: Color.lerp(divider, other.divider, t),
      ok: Color.lerp(ok, other.ok, t),
    );
  }
}
