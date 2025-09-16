import 'package:flutter/material.dart';
import 'package:oemdoc/Feature/Product/presentation/view_model/views/widgets/ListProducts.dart';
import 'package:oemdoc/Feature/Product/presentation/view_model/views/widgets/ProductCard.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/utiles/Colors.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: SecoundColor,
      appBar: CustomAppBar(title: S.of(context).Products),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenWidth * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: SizedBox(
                    height: screenWidth * 0.12,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(screenWidth * 32),
                        border: Border.all(color: const Color(0xff333333)),
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: S.of(context).searchByPart,
                          hintStyle: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                          prefixIcon: SizedBox(
                            width: screenWidth * 0.12,
                            height: screenWidth * 0.12,
                            child: Center(
                              child: Image.asset(
                                'Assets/search.png',
                                color: Colors.black54,
                                fit: BoxFit.contain,
                                width: screenWidth * 0.05,
                                height: screenWidth * 0.05,
                              ),
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).SuggestedForYourCar,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: KprimaryText,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ProductCard(
                          product: products[0],
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          context: context,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      Expanded(
                        child: ProductCard(
                          product: products[1],
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          context: context,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: ProductCard(
                          product: products[2],
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          context: context,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      Expanded(
                        child: ProductCard(
                          product: products[3],
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.12),
          ],
        ),
      ),
    );
  }
}


