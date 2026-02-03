import 'package:flutter/material.dart';

const primary = Color(0xFFDC0E51);
const secondary = Color(0xFF4A4064);
const tertiary = Color(0xFFF42829);
const neutral = Color(0xFF003CFF);
const utilitypink = Color(0xFFE60000);
const utilityorange = Color(0xFFF38707);
const utilitygreen = Color(0xFF2F9803);


CustomColors lightCustomColors = const CustomColors(
  sourcePrimary: Color(0xFFDC0E51),
  primary: Color(0xFFBD0043),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFD9DC),
  onPrimaryContainer: Color(0xFF400011),
  sourceSecondary: Color(0xFF4A4064),
  secondary: Color(0xFF6750A4),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE9DDFF),
  onSecondaryContainer: Color(0xFF22005C),
  sourceTertiary: Color(0xFFF42829),
  tertiary: Color(0xFFC00012),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDAD6),
  onTertiaryContainer: Color(0xFF410002),
  sourceNeutral: Color(0xFF003CFF),
  neutral: Color(0xFF1342FF),
  onNeutral: Color(0xFFFFFFFF),
  neutralContainer: Color(0xFFDEE0FF),
  onNeutralContainer: Color(0xFF000F5C),
  sourceUtilitypink: Color(0xFFE60000),
  utilitypink: Color(0xFFC00000),
  onUtilitypink: Color(0xFFFFFFFF),
  utilitypinkContainer: Color(0xFFFFDAD4),
  onUtilitypinkContainer: Color(0xFF410000),
  sourceUtilityorange: Color(0xFFF38707),
  utilityorange: Color(0xFF904D00),
  onUtilityorange: Color(0xFFFFFFFF),
  utilityorangeContainer: Color(0xFFFFDCC2),
  onUtilityorangeContainer: Color(0xFF2E1500),
  sourceUtilitygreen: Color(0xFF2F9803),
  utilitygreen: Color(0xFF1E6D00),
  onUtilitygreen: Color(0xFFFFFFFF),
  utilitygreenContainer: Color(0xFF90FC69),
  onUtilitygreenContainer: Color(0xFF042100),
);

CustomColors darkCustomColors = const CustomColors(
  sourcePrimary: Color(0xFFDC0E51),
  primary: Color(0xFFFFB2BA),
  onPrimary: Color(0xFF670021),
  primaryContainer: Color(0xFF910031),
  onPrimaryContainer: Color(0xFFFFD9DC),
  sourceSecondary: Color(0xFF4A4064),
  secondary: Color(0xFFCFBCFF),
  onSecondary: Color(0xFF381E72),
  secondaryContainer: Color(0xFF4F378A),
  onSecondaryContainer: Color(0xFFE9DDFF),
  sourceTertiary: Color(0xFFF42829),
  tertiary: Color(0xFFFFB4AB),
  onTertiary: Color(0xFF690005),
  tertiaryContainer: Color(0xFF93000B),
  onTertiaryContainer: Color(0xFFFFDAD6),
  sourceNeutral: Color(0xFF003CFF),
  neutral: Color(0xFFBAC3FF),
  onNeutral: Color(0xFF001E91),
  neutralContainer: Color(0xFF002ECB),
  onNeutralContainer: Color(0xFFDEE0FF),
  sourceUtilitypink: Color(0xFFE60000),
  utilitypink: Color(0xFFFFB4A8),
  onUtilitypink: Color(0xFF690000),
  utilitypinkContainer: Color(0xFF930100),
  onUtilitypinkContainer: Color(0xFFFFDAD4),
  sourceUtilityorange: Color(0xFFF38707),
  utilityorange: Color(0xFFFFB77C),
  onUtilityorange: Color(0xFF4D2700),
  utilityorangeContainer: Color(0xFF6D3900),
  onUtilityorangeContainer: Color(0xFFFFDCC2),
  sourceUtilitygreen: Color(0xFF2F9803),
  utilitygreen: Color(0xFF74DE4F),
  onUtilitygreen: Color(0xFF0C3900),
  utilitygreenContainer: Color(0xFF155200),
  onUtilitygreenContainer: Color(0xFF90FC69),
);



/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourcePrimary,
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.sourceSecondary,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.sourceTertiary,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.sourceNeutral,
    required this.neutral,
    required this.onNeutral,
    required this.neutralContainer,
    required this.onNeutralContainer,
    required this.sourceUtilitypink,
    required this.utilitypink,
    required this.onUtilitypink,
    required this.utilitypinkContainer,
    required this.onUtilitypinkContainer,
    required this.sourceUtilityorange,
    required this.utilityorange,
    required this.onUtilityorange,
    required this.utilityorangeContainer,
    required this.onUtilityorangeContainer,
    required this.sourceUtilitygreen,
    required this.utilitygreen,
    required this.onUtilitygreen,
    required this.utilitygreenContainer,
    required this.onUtilitygreenContainer,
  });

  final Color? sourcePrimary;
  final Color? primary;
  final Color? onPrimary;
  final Color? primaryContainer;
  final Color? onPrimaryContainer;
  final Color? sourceSecondary;
  final Color? secondary;
  final Color? onSecondary;
  final Color? secondaryContainer;
  final Color? onSecondaryContainer;
  final Color? sourceTertiary;
  final Color? tertiary;
  final Color? onTertiary;
  final Color? tertiaryContainer;
  final Color? onTertiaryContainer;
  final Color? sourceNeutral;
  final Color? neutral;
  final Color? onNeutral;
  final Color? neutralContainer;
  final Color? onNeutralContainer;
  final Color? sourceUtilitypink;
  final Color? utilitypink;
  final Color? onUtilitypink;
  final Color? utilitypinkContainer;
  final Color? onUtilitypinkContainer;
  final Color? sourceUtilityorange;
  final Color? utilityorange;
  final Color? onUtilityorange;
  final Color? utilityorangeContainer;
  final Color? onUtilityorangeContainer;
  final Color? sourceUtilitygreen;
  final Color? utilitygreen;
  final Color? onUtilitygreen;
  final Color? utilitygreenContainer;
  final Color? onUtilitygreenContainer;

  @override
  CustomColors copyWith({
    Color? sourcePrimary,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? sourceSecondary,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? sourceTertiary,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? sourceNeutral,
    Color? neutral,
    Color? onNeutral,
    Color? neutralContainer,
    Color? onNeutralContainer,
    Color? sourceUtilitypink,
    Color? utilitypink,
    Color? onUtilitypink,
    Color? utilitypinkContainer,
    Color? onUtilitypinkContainer,
    Color? sourceUtilityorange,
    Color? utilityorange,
    Color? onUtilityorange,
    Color? utilityorangeContainer,
    Color? onUtilityorangeContainer,
    Color? sourceUtilitygreen,
    Color? utilitygreen,
    Color? onUtilitygreen,
    Color? utilitygreenContainer,
    Color? onUtilitygreenContainer,
  }) {
    return CustomColors(
      sourcePrimary: sourcePrimary ?? this.sourcePrimary,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      sourceSecondary: sourceSecondary ?? this.sourceSecondary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      sourceTertiary: sourceTertiary ?? this.sourceTertiary,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      sourceNeutral: sourceNeutral ?? this.sourceNeutral,
      neutral: neutral ?? this.neutral,
      onNeutral: onNeutral ?? this.onNeutral,
      neutralContainer: neutralContainer ?? this.neutralContainer,
      onNeutralContainer: onNeutralContainer ?? this.onNeutralContainer,
      sourceUtilitypink: sourceUtilitypink ?? this.sourceUtilitypink,
      utilitypink: utilitypink ?? this.utilitypink,
      onUtilitypink: onUtilitypink ?? this.onUtilitypink,
      utilitypinkContainer: utilitypinkContainer ?? this.utilitypinkContainer,
      onUtilitypinkContainer: onUtilitypinkContainer ?? this.onUtilitypinkContainer,
      sourceUtilityorange: sourceUtilityorange ?? this.sourceUtilityorange,
      utilityorange: utilityorange ?? this.utilityorange,
      onUtilityorange: onUtilityorange ?? this.onUtilityorange,
      utilityorangeContainer: utilityorangeContainer ?? this.utilityorangeContainer,
      onUtilityorangeContainer: onUtilityorangeContainer ?? this.onUtilityorangeContainer,
      sourceUtilitygreen: sourceUtilitygreen ?? this.sourceUtilitygreen,
      utilitygreen: utilitygreen ?? this.utilitygreen,
      onUtilitygreen: onUtilitygreen ?? this.onUtilitygreen,
      utilitygreenContainer: utilitygreenContainer ?? this.utilitygreenContainer,
      onUtilitygreenContainer: onUtilitygreenContainer ?? this.onUtilitygreenContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourcePrimary: Color.lerp(sourcePrimary, other.sourcePrimary, t),
      primary: Color.lerp(primary, other.primary, t),
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t),
      primaryContainer: Color.lerp(primaryContainer, other.primaryContainer, t),
      onPrimaryContainer: Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t),
      sourceSecondary: Color.lerp(sourceSecondary, other.sourceSecondary, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t),
      secondaryContainer: Color.lerp(secondaryContainer, other.secondaryContainer, t),
      onSecondaryContainer: Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t),
      sourceTertiary: Color.lerp(sourceTertiary, other.sourceTertiary, t),
      tertiary: Color.lerp(tertiary, other.tertiary, t),
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t),
      tertiaryContainer: Color.lerp(tertiaryContainer, other.tertiaryContainer, t),
      onTertiaryContainer: Color.lerp(onTertiaryContainer, other.onTertiaryContainer, t),
      sourceNeutral: Color.lerp(sourceNeutral, other.sourceNeutral, t),
      neutral: Color.lerp(neutral, other.neutral, t),
      onNeutral: Color.lerp(onNeutral, other.onNeutral, t),
      neutralContainer: Color.lerp(neutralContainer, other.neutralContainer, t),
      onNeutralContainer: Color.lerp(onNeutralContainer, other.onNeutralContainer, t),
      sourceUtilitypink: Color.lerp(sourceUtilitypink, other.sourceUtilitypink, t),
      utilitypink: Color.lerp(utilitypink, other.utilitypink, t),
      onUtilitypink: Color.lerp(onUtilitypink, other.onUtilitypink, t),
      utilitypinkContainer: Color.lerp(utilitypinkContainer, other.utilitypinkContainer, t),
      onUtilitypinkContainer: Color.lerp(onUtilitypinkContainer, other.onUtilitypinkContainer, t),
      sourceUtilityorange: Color.lerp(sourceUtilityorange, other.sourceUtilityorange, t),
      utilityorange: Color.lerp(utilityorange, other.utilityorange, t),
      onUtilityorange: Color.lerp(onUtilityorange, other.onUtilityorange, t),
      utilityorangeContainer: Color.lerp(utilityorangeContainer, other.utilityorangeContainer, t),
      onUtilityorangeContainer: Color.lerp(onUtilityorangeContainer, other.onUtilityorangeContainer, t),
      sourceUtilitygreen: Color.lerp(sourceUtilitygreen, other.sourceUtilitygreen, t),
      utilitygreen: Color.lerp(utilitygreen, other.utilitygreen, t),
      onUtilitygreen: Color.lerp(onUtilitygreen, other.onUtilitygreen, t),
      utilitygreenContainer: Color.lerp(utilitygreenContainer, other.utilitygreenContainer, t),
      onUtilitygreenContainer: Color.lerp(onUtilitygreenContainer, other.onUtilitygreenContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
    );
  }
}