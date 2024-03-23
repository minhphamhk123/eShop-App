import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey.withOpacity(0.5);
          }
          return Colors.white;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return Colors.black;
        },
      ),
    ),
  );

  static OutlinedButtonThemeData darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey.withOpacity(0.5);
          }
          return Colors.black;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return Colors.white;
        },
      ),
    ),
  );
}
