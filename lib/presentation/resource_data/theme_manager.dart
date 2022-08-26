import 'package:flutter/services.dart';

import './color_manager.dart';
import './font_manager.dart';
import './style_manager.dart';
import './values_managers.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,

    //primaryColorLight: ColorManager.primary,
    //primaryColorDark: ColorManager.primary,
    //disabledColor: ColorManager.grey1,
    //splashColor: ColorManager.lightPrimary, // ripple effect color

//card theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.background,
      elevation: AppSize.s4,
    ),

    //app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light, // 2
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.background,
        titleTextStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16)),

    //Button Theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.background,
      buttonColor: ColorManager.orange,
      splashColor: ColorManager.background,
    ),

    // Text Theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
          color: ColorManager.background, fontSize: FontSize.s16),
      headlineLarge: getSemiBoldStyle(
          color: ColorManager.background, fontSize: FontSize.s16),
      headlineMedium: getRegularStyle(
          color: ColorManager.background, fontSize: FontSize.s14),
      titleMedium:
          getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      bodyLarge: getRegularStyle(color: ColorManager.background),
      bodySmall: getRegularStyle(color: ColorManager.background),
    ),

    //input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      //Content Padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      //hint style
      hintStyle:
          getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      //label style
      labelStyle:
          getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),

      //enable border style
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //focus border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.orange, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //focus error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
