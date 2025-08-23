import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../../../../../Core/utiles/LocaleCubit.dart';
import '../../../../../generated/l10n.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).settings),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) {
            return Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                color: SecoundColor,
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (locale.languageCode == 'ar') {
                        context
                            .read<LocaleCubit>()
                            .changeLanguage(const Locale('en'));
                      } else {
                        context
                            .read<LocaleCubit>()
                            .changeLanguage(const Locale('ar'));
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.language,
                            size: screenWidth * 0.06, color: KprimaryColor),
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
                        Icon(Icons.arrow_forward_ios,
                            size: screenWidth * 0.045, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
