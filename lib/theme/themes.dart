import 'package:flutter/material.dart';
import 'package:themed/themed.dart';

class LightTheme {
  static const textPrimary = Color(0xFF080816);
  static const textSecondary = Color(0xff8f8ea1);
  static const textInfo = Color(0xff1f75ff);
  static const canvas = Color(0xffffffff);
  static const content = Color(0xff8f8ea1);
  static const btnNeutral = Color(0xfff1f0f5);
}

class DarkTheme {
  // TODO: Replace the dark theme colors with a proper theme.
  static const textPrimary = Color(0xFF080816);
  static const textSecondary = Color(0xff8f8ea1);
  static const textInfo = Color(0xff1f75ff);
  static const canvas = Color(0xffffffff);
  static const content = Color(0xff8f8ea1);
  static const btnNeutral = Color(0xfff1f0f5);
}

class CurrentTheme {
  static const textPrimary = ColorRef(Color(0xFF080816));
  static const textSecondary = ColorRef(Color(0xff8f8ea1));
  static const textInfo = ColorRef(Color(0xff1f75ff));
  static const canvas = ColorRef(Color(0xffffffff));
  static const content = ColorRef(Color(0xffebeaef));
  static const content2 = ColorRef(Color(0xff8f8ea1));
  static const btnNeutral = ColorRef(Color(0xfff1f0f5));
}

Map<ThemeRef, Object> lightTheme = {
  CurrentTheme.textPrimary: LightTheme.textPrimary,
  CurrentTheme.textSecondary: LightTheme.textSecondary,
  CurrentTheme.textInfo: LightTheme.textInfo,
  CurrentTheme.canvas: LightTheme.canvas,
  CurrentTheme.content: LightTheme.content,
  CurrentTheme.btnNeutral: LightTheme.btnNeutral
};

Map<ThemeRef, Object> darkTheme = {
  CurrentTheme.textPrimary: DarkTheme.textPrimary,
  CurrentTheme.textSecondary: DarkTheme.textSecondary,
  CurrentTheme.textInfo: DarkTheme.textInfo,
  CurrentTheme.canvas: DarkTheme.canvas,
  CurrentTheme.content: DarkTheme.content,
  CurrentTheme.btnNeutral: DarkTheme.btnNeutral
};