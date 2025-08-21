import 'package:flutter/material.dart';

import '../../../../../../Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: S.of(context).PhoneNumber,
            style: TextStyle(
              color: KprimaryText,
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(
                text: ' * ',
                style: TextStyle(
                  color: KprimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: screenHeight * 0.01),

        /// حقل إدخال رقم الهاتف
        SizedBox(
          height: screenWidth * 0.12,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xffFAFAFA),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xff333333)),
            ),
            child: TextField(
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
                hintText: S.of(context).PhoneNumber,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenWidth * 0.035,
                  horizontal: screenWidth * 0.035,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(isArabic ? 3.1416 : 0),
                    child: Icon(
                      Icons.phone_enabled_outlined,
                      size: screenWidth * 0.05,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
        ),
      ],
    );
  }
}
