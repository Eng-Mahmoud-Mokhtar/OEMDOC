import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../../../../../Core/utiles/LocaleCubit.dart';
import '../../../../../generated/l10n.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(title: S.of(context).settings),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) {
            return Align( // يخلي الكونتينر على قد المحتوى
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                decoration: BoxDecoration(
                  color: SecoundColor,
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // يخلي الطول على قد المحتوى
                  children: [
                    SizedBox(height: screenWidth * 0.02),
                    GestureDetector(
                      onTap: () {
                        if (locale.languageCode == 'ar') {
                          context.read<LocaleCubit>().changeLanguage(const Locale('en'));
                        } else {
                          context.read<LocaleCubit>().changeLanguage(const Locale('ar'));
                        }
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "Assets/ion_language.png",
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                            fit: BoxFit.contain,
                            color: KprimaryText,
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
                          const Spacer(),
                          Text(
                            locale.languageCode == 'ar' ? 'العربية' : 'English',
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Icon(
                            Icons.swap_horiz_outlined,
                            size: screenWidth * 0.05,
                            color: KprimaryColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Divider(
                      color: Colors.grey.shade100,
                      thickness: 1,
                      height: screenHeight * 0.01,
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Row(
                      children: [
                        Image.asset(
                          "Assets/Vector.png",
                          width: screenWidth * 0.05,
                          height: screenWidth * 0.05,
                          fit: BoxFit.contain,
                          color: KprimaryText,
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Text(
                          S.of(context).notificationsTitle,
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w500,
                            color: KprimaryText,
                          ),
                        ),
                        const Spacer(),
                        Switch(
                          value: notificationsEnabled,
                          activeColor: KprimaryColor,
                          inactiveTrackColor: KprimaryText,
                          activeTrackColor: KprimaryColor.withOpacity(0.5),
                          inactiveThumbColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              notificationsEnabled = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
