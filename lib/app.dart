import 'package:e_store/bindings/general_bindings.dart';
import 'package:e_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/theme/theme.dart';
import'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white,),)),
    );
  }
}