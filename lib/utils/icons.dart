import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture getSvg({
  required String type,
  required String name,
  double? height,
  double? width,
  Color? color,
}) {
  return SvgPicture.asset(
    'assets/$type/$name.svg',
    height: height,
    width: width,
    color: color,
  );
}
