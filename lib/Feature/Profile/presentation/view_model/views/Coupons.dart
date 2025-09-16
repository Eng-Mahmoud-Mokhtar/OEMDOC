import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../generated/l10n.dart';

class Coupons extends StatelessWidget {
  const Coupons({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    Widget buildCoupon({
      required String title,
      required String code,
      required String description,
      required String buttonText,
      required String sideText,
    }) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: ClipPath(
          clipper: ReceiptClipper(MediaQuery.of(context).size),
          child: Container(
            color: KprimaryColor,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon:
                              Icon(Icons.copy, color: KprimaryColor,size:screenWidth * 0.05 ,),
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: code));
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                    fontWeight: FontWeight.w500,
                                    color: KprimaryText,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  code,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(height: 12),
                        SizedBox(
                          height: screenWidth * 0.09,
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  color: Color(0XFFECE7F8), width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              buttonText,
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                color: KprimaryText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.2,
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        sideText,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: CustomAppBar(title: S.of(context).coupons),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: ListView(
            children: [
              buildCoupon(
                title: "مستخدم جديد",
                code: "FINFIRST25",
                description:
                "وفر 25 دولار على جميع المعاملات التي تزيد عن 250 دولار",
                buttonText: "تسوق الآن",
                sideText: "DISCOUNT",
              ),
              SizedBox(height: screenWidth * 0.04),
              buildCoupon(
                title: "عميل مميز",
                code: "VIPDISCOUNT",
                description: "استمتع بخصم 15% على جميع الطلبات",
                buttonText: "استخدم الكود الآن",
                sideText: "عرض خاص",
              ),
              SizedBox(height: screenWidth * 0.04),
              buildCoupon(
                title: "مستخدم قديم",
                code: "LOYALTY10",
                description:
                "احصل على 10 دولارات خصم على طلبك القادم. امتيازات",
                buttonText: "تسوق الآن",
                sideText: "عرض خاص",
              ),
              SizedBox(height: screenWidth * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}

class ReceiptClipper extends CustomClipper<Path> {
  final Size screenSize;

  ReceiptClipper(this.screenSize);

  @override
  Path getClip(Size size) {
    // احسب القيم ديناميكيًا
    final int waves = 6;
    final double corner = screenSize.width * 0.04;
    final double radius = screenSize.width * 0.02;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - corner, 0);
    path.quadraticBezierTo(size.width, 0, size.width, corner);

    final availableHeight = size.height - (corner * 2);
    final wavesHeight = waves * (radius * 2);
    final gapsCount = waves + 1;
    final gap = (availableHeight - wavesHeight) / gapsCount;

    double y = corner + gap / 2;

    for (int i = 0; i < waves; i++) {
      path.arcToPoint(
        Offset(size.width, y + radius * 2),
        radius: Radius.circular(radius),
        clockwise: false,
      );
      y += radius * 2;

      if (i != waves - 1) {
        path.lineTo(size.width, y + gap);
        y += gap;
      }
    }

    path.lineTo(size.width, size.height - corner);
    path.quadraticBezierTo(
        size.width, size.height, size.width - corner, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
