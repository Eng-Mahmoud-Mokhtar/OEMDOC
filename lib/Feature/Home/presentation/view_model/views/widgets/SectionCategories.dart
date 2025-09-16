import 'package:flutter/material.dart';
import '../../../../../../Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';
import 'categoriesData.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).Categories,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
            color: KprimaryText,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Column(
          children: categoriesData.map((category) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        category["logo"]!,
                        fit: BoxFit.contain,
                        height:screenWidth * 0.15,
                        width: screenWidth * 0.15,
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getCategoryName(context, category["key"]!),
                            style: TextStyle(
                              color: KprimaryText,
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${category["results"]} ${S.of(context).Product}",
                            style: TextStyle(
                              fontSize: screenWidth * 0.028,
                              color: KprimaryText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Directionality(
                    textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: KprimaryText,
                      size: screenWidth * 0.05,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
