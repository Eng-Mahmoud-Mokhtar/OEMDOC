import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/utiles/Colors.dart';
import '../../../../../../Core/utiles/LocaleCubit.dart';
import '../../../../../../generated/l10n.dart';

Widget buildLanguageSwapOption(
    BuildContext context, {
      required Locale locale,
      required double screenWidth,
      required double screenHeight,
    }) {
  return GestureDetector(
    onTap: () {
      if (locale.languageCode == 'ar') {
        context.read<LocaleCubit>().changeLanguage(const Locale('en'));
      } else {
        context.read<LocaleCubit>().changeLanguage(const Locale('ar'));
      }
    },
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.015,
      ),
      decoration: BoxDecoration(
        color: SecoundColor,
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'Assets/tabler_world.png',
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
            fit: BoxFit.contain,
          ),
          SizedBox(width: screenWidth * 0.03),
          Text(
            S.of(context).language,
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.w500,
              color: KprimaryText,
            ),
          ),
          Spacer(),
          Text(
            locale.languageCode == 'ar' ? 'العربية' : 'English',
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.bold,
              color: KprimaryColor,
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Icon(Icons.swap_horiz, size: screenWidth * 0.06, color: KprimaryColor),
        ],
      ),
    ),
  );
}