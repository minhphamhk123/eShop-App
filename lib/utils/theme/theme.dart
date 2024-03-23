import 'package:e_store/utils/theme/custom.themes/elevated_button.dart';
import 'package:flutter/material.dart';

import 'custom.themes/bottom_sheet_theme.dart';
import 'custom.themes/checkbox_theme.dart';
import 'custom.themes/chip_theme.dart';
import 'custom.themes/outlined_button_theme.dart';
import 'custom.themes/text_theme.dart';
import 'custom.themes/textfield_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      bottomSheetTheme: TBottomSheetTheme.lightBottomSheetThemm,
      checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
      chipTheme: TChipTheme.lightChipTheme,
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
      chipTheme: TChipTheme.darkChipTheme,
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
  );
}
