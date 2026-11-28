
import 'package:flutter/material.dart';
import 'package:save_pass/ui/colors.dart';
import 'package:save_pass/ui/text_styles.dart';

const _smallTextScaleFactor = 0.80;
const _largeTextScaleFactor = 1.20;

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.black900,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.primaryLight,
        surface: AppColors.black800,
        error: AppColors.red,
      ),
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textTheme: _textTheme,
      dialogBackgroundColor: AppColors.black900,
      dialogTheme: _dialogTheme,
      tooltipTheme: _tooltipTheme,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerTheme,
      useMaterial3: true,
    );
  }

  static ThemeData get small {
    return dark.copyWith(textTheme: _smallTextTheme);
  }

  static ThemeData get medium {
    return dark.copyWith(textTheme: _smallTextTheme);
  }

  static ThemeData get large {
    return dark.copyWith(textTheme: _largeTextTheme);
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: AppTextStyle.headline1,
      displayMedium: AppTextStyle.headline2,
      displaySmall: AppTextStyle.headline3,
      headlineMedium: AppTextStyle.headline4,
      headlineSmall: AppTextStyle.headline5,
      titleLarge: AppTextStyle.headline6,
      titleMedium: AppTextStyle.subtitle1,
      titleSmall: AppTextStyle.subtitle2,
      bodyLarge: AppTextStyle.bodyText1,
      bodyMedium: AppTextStyle.bodyText2,
      bodySmall: AppTextStyle.caption,
      labelSmall: AppTextStyle.overline,
      labelLarge: AppTextStyle.button,
    );
  }

  static TextTheme get _smallTextTheme {
    return _scaleTextTheme(_smallTextScaleFactor);
  }

  static TextTheme get _largeTextTheme {
    return _scaleTextTheme(_largeTextScaleFactor);
  }

  static TextTheme _scaleTextTheme(double factor) {
    final theme = _textTheme;

    return TextTheme(
      displayLarge: _scaleStyle(theme.displayLarge, factor),
      displayMedium: _scaleStyle(theme.displayMedium, factor),
      displaySmall: _scaleStyle(theme.displaySmall, factor),
      headlineMedium: _scaleStyle(theme.headlineMedium, factor),
      headlineSmall: _scaleStyle(theme.headlineSmall, factor),
      titleLarge: _scaleStyle(theme.titleLarge, factor),
      titleMedium: _scaleStyle(theme.titleMedium, factor),
      titleSmall: _scaleStyle(theme.titleSmall, factor),
      bodyLarge: _scaleStyle(theme.bodyLarge, factor),
      bodyMedium: _scaleStyle(theme.bodyMedium, factor),
      bodySmall: _scaleStyle(theme.bodySmall, factor),
      labelSmall: _scaleStyle(theme.labelSmall, factor),
      labelLarge: _scaleStyle(theme.labelLarge, factor),
    );
  }

  static TextStyle? _scaleStyle(TextStyle? style, double factor) {
    if (style == null || style.fontSize == null) return style;

    return style.copyWith(fontSize: style.fontSize! * factor);
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.white,
      titleTextStyle: AppTextStyle.headline6,
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        side: const BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.black800,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: AppColors.white),
    );
  }

  static DialogThemeData get _dialogTheme {
    return DialogThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: AppColors.black900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  static TabBarThemeData get _tabBarTheme {
    return const TabBarThemeData(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2,
          color: AppColors.primary,
        ),
      ),
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.gray500,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      space: 0,
      thickness: 1,
      color: AppColors.black25,
    );
  }
}
