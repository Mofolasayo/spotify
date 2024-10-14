import 'package:flutter/material.dart';

class AppTextStyles {
  static const String fontFamily = 'Satoshi';
  static double defaultFontSize = 16;
  static double defaultSpacing = 0;

  static TextStyle light({
    Color? color,
    double? fontSize,
    bool? isItalic,
    double? spacing,
  }) {
    return TextStyle(
      letterSpacing: spacing ?? defaultSpacing,
      fontFamily: fontFamily,
      fontSize: fontSize ?? defaultFontSize,
      color: color,
      fontStyle: (isItalic ?? false) ? FontStyle.italic : FontStyle.normal,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle regular({
    Color? color,
    double? fontSize,
    bool? isItalic,
    double? spacing,
  }) {
    return TextStyle(
      letterSpacing: spacing ?? defaultSpacing,
      fontFamily: fontFamily,
      fontSize: fontSize ?? defaultFontSize,
      color: color,
      fontStyle: (isItalic ?? false) ? FontStyle.italic : FontStyle.normal,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium({
    Color? color,
    double? fontSize,
    bool? isItalic,
    double? spacing,
  }) {
    return TextStyle(
      letterSpacing: spacing ?? defaultSpacing,
      fontFamily: fontFamily,
      fontSize: fontSize ?? defaultFontSize,
      color: color,
      fontStyle: (isItalic ?? false) ? FontStyle.italic : FontStyle.normal,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle bold({
    Color? color,
    double? fontSize,
    bool? isItalic,
    double? spacing,
  }) {
    return TextStyle(
      letterSpacing: spacing ?? defaultSpacing,
      fontFamily: fontFamily,
      fontSize: fontSize ?? defaultFontSize,
      color: color,
      fontStyle: (isItalic ?? false) ? FontStyle.italic : FontStyle.normal,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle black({
    Color? color,
    double? fontSize,
    bool? isItalic,
    double? spacing,
  }) {
    return TextStyle(
      letterSpacing: spacing ?? defaultSpacing,
      fontFamily: fontFamily,
      fontSize: fontSize ?? defaultFontSize,
      color: color,
      fontStyle: (isItalic ?? false) ? FontStyle.italic : FontStyle.normal,
      fontWeight: FontWeight.w900,
    );
  }
}
