import 'package:flutter/material.dart';
import '../../../../../../Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../Product.dart';
import '../ProductDetailsPage.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double screenWidth;
  final double screenHeight;
  final BuildContext context;

  const ProductCard({
    super.key,
    required this.product,
    required this.screenWidth,
    required this.screenHeight,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(product: product),
            ),
          );
        },
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
                      product.imagePath,
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
                  bool filled = index < product.rating.floor();
                  return Icon(
                    filled ? Icons.star : Icons.star_border,
                    color: filled ? KprimaryColor : Colors.black,
                    size: screenWidth * 0.06,
                  );
                }),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                product.title,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                product.subtitle,
                style: TextStyle(
                  fontSize: screenWidth * 0.025,
                  color: SecoundText,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                "${product.price} ${S.of(context).SYP}",
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
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.015,
                    ),
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
    );
  }
}
