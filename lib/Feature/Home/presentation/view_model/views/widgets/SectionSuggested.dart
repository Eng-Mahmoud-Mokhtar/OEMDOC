import 'package:flutter/material.dart';
import 'package:oemdoc/Feature/Product/presentation/view_model/views/SuggerstedForYou.dart';
import '../../../../../../Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';

class SuggestedWidget extends StatelessWidget {
  const SuggestedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).SuggestedForYourCar,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: KprimaryText,
              ),
            ),
            Directionality(
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Products(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: KprimaryText,
                  size: screenWidth * 0.05,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'Assets/image 5.png',
                              width: double.infinity,
                              height: screenWidth * 0.3,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            top: -10,
                            left: 0,
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: KprimaryText,
                                size: screenWidth * 0.07,
                              ),
                              onPressed: () {},
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(5, (index) {
                          bool filled = index < 4;
                          return Icon(
                            filled ? Icons.star : Icons.star_border,
                            color: filled ? KprimaryColor : Colors.black,
                            size: screenWidth * 0.06,
                          );
                        }),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        "زيت ليكو مولي",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "زيت محرك تويوتا كورولا",
                        style: TextStyle(
                          fontSize: screenWidth * 0.025,
                          color: SecoundText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "120.00 ${S.of(context).SYP}",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: KprimaryText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: KprimaryColor,
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: Localizations.localeOf(context).languageCode == 'ar'
                                ? [
                              Text(
                                S.of(context).AddtoCart,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Image.asset(
                                'Assets/Vector5.png',
                                width: screenWidth * 0.05,
                                height: screenWidth * 0.04,
                                fit: BoxFit.contain,

                              ),
                            ]
                                : [
                              Image.asset(
                                'Assets/Vector5.png',
                                width: screenWidth * 0.05,
                                height: screenWidth * 0.04,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                S.of(context).AddtoCart,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'Assets/image 5.png',
                              width: double.infinity,
                              height: screenWidth * 0.3,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            top: -10,
                            left: 0,
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: KprimaryText,
                                size: screenWidth * 0.07,
                              ),
                              onPressed: () {},
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(5, (index) {
                          bool filled = index < 4;
                          return Icon(
                            filled ? Icons.star : Icons.star_border,
                            color: filled ? KprimaryColor : Colors.black,
                            size: screenWidth * 0.06,
                          );
                        }),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        "زيت ليكو مولي",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "زيت محرك تويوتا كورولا",
                        style: TextStyle(
                          fontSize: screenWidth * 0.025,
                          color: SecoundText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "120.00 ${S.of(context).SYP}",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: KprimaryText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: KprimaryColor,
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: Localizations.localeOf(context).languageCode == 'ar'
                                ? [
                              Text(
                                S.of(context).AddtoCart,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Image.asset(
                                'Assets/Vector5.png',
                                width: screenWidth * 0.05,
                                height: screenWidth * 0.04,
                                fit: BoxFit.contain,

                              ),
                            ]
                                : [
                              Image.asset(
                                'Assets/Vector5.png',
                                width: screenWidth * 0.05,
                                height: screenWidth * 0.04,
                                fit: BoxFit.contain,

                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                S.of(context).AddtoCart,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
