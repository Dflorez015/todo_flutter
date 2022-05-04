import 'package:flutter/material.dart';

const Color main_background_color = Color.fromRGBO(52, 81, 161, 1);
const Color text_color = Color.fromRGBO(254, 254, 254, 0.847);
const Color second_color = Color.fromRGBO(4, 25, 85, 1);

const BorderSide inputBorder = BorderSide(color: Colors.black);

ShapeBorder shape_main =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0));

circularCheckBorder(ThemeData theme) {
  final oldCheckboxTheme = theme.checkboxTheme;
  final newCheckBoxTheme = oldCheckboxTheme.copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    splashRadius: 10,
  );
  return newCheckBoxTheme;
}
