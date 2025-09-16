import 'package:flutter/material.dart';
import 'package:oemdoc/Feature/Product/presentation/view_model/views/widgets/DeliveryFeature.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../Product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final TextDirection textDirection = isArabic ? TextDirection.rtl : TextDirection.ltr;
    final reviews = [
      {
        'userName': 'أحمد محمد',
        'time': 'منذ شهر',
        'rating': 4.5,
        'comment': 'بصراحة جربت كذا نوع زيت قبل كده، بس أول ما استخدمت النوع ده حسيت فعلاً بفرق كبير في أداء العربية. صوت الموتور بقى أنعم، والسحب اتحسن بشكل واضح. أنصح أي حد مهتم بسيارته يجربه، ممتاز مقابل السعر',
      },
    ];

    return Scaffold(
      backgroundColor: SecoundColor,
      appBar: CustomAppBar(title: S.of(context).ProductDetails),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Directionality(
                textDirection: textDirection,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                              color: KprimaryText,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            product.subtitle,
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6B6B6B),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.005),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.star, color: KprimaryColor, size: screenWidth * 0.05),
                                    SizedBox(width: screenWidth * 0.01),
                                    Text(
                                      '${product.rating}',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.01),
                                    Text(
                                      '(${product.ratersCount})',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                        color: SecoundText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.1,
                                    height: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                      color: Color(0xffE6E6E6),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: KprimaryText,
                                        size: screenWidth * 0.06,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: screenHeight * 0.01),
                                  Container(
                                    width: screenWidth * 0.1,
                                    height: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                      color: Color(0xffE6E6E6),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.share_outlined,
                                        color: KprimaryText,
                                        size: screenWidth * 0.06,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        product.imagePath,
                        width: double.infinity,
                        height: screenHeight * 0.25,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${product.price} ${S.of(context).SYP}',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: KprimaryText,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          product.oldPrice,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey,
                            decorationThickness: 1.5,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          product.discount,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: ThirdColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.07,
                          height: screenWidth * 0.07,
                          decoration: BoxDecoration(
                            color: Color(0xff666666),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.star_border,
                              size: screenWidth * 0.05,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          product.category,
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: KprimaryText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          decoration: BoxDecoration(
                            color: ThirdColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            S.of(context).Delivery,
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          S.of(context).GetItNow,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: SecoundText,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: DeliveryFeature(
                              imagePath: 'Assets/fast.png',
                              label: S.of(context).FastDelivery,
                              screenWidth: screenWidth,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: screenWidth * 0.2,
                            color: Color(0XFFE6E6E6),
                          ),
                          Expanded(
                            child: DeliveryFeature(
                              imagePath: 'Assets/vote.png',
                              label: S.of(context).TopRatedSeller,
                              screenWidth: screenWidth,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: screenWidth * 0.2,
                            color: Color(0XFFE6E6E6),
                          ),
                          Expanded(
                            child: DeliveryFeature(
                              imagePath: 'Assets/push.png',
                              label: S.of(context).CashOnDelivery,
                              screenWidth: screenWidth,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: screenWidth * 0.2,
                            color: Color(0XFFE6E6E6),
                          ),
                          Expanded(
                            child: DeliveryFeature(
                              imagePath: 'Assets/ic_sharp-security.png',
                              label: S.of(context).SecureArrival,
                              screenWidth: screenWidth,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: screenWidth * 0.12,
                                height: screenWidth * 0.12,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                child: const Icon(Icons.person, color: Colors.white),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.sellerName,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.005),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.02,
                                            vertical: screenHeight * 0.005,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: KprimaryColor,
                                                size: screenWidth * 0.05,
                                              ),
                                              SizedBox(width: screenWidth * 0.01),
                                              Text(
                                                '${product.sellerRating}',
                                                style: TextStyle(
                                                  fontSize: screenWidth * 0.03,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.02),
                                        Expanded(
                                          child: Text(
                                            '${product.sellerPositivePercentage} % ${S.of(context).FromPositiveReviews}',
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.03,
                                              color: SecoundText,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: screenWidth * 0.04,
                                color: KprimaryText,
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Divider(color: Colors.grey[300]),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.1,
                                    height: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffE6E6E6),
                                    ),
                                    child: Image.asset(
                                      "Assets/box.png",
                                      width: screenWidth * 0.05,
                                      height: screenWidth * 0.05,
                                      color: KprimaryColor,
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.02),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.of(context).ProductAsDescribed,
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.03,
                                          color: KprimaryText,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: screenWidth * 0.2,
                                            height: screenHeight * 0.005,
                                            child: LinearProgressIndicator(
                                              value: 0.8,
                                              backgroundColor: Colors.grey[300],
                                              color: ThirdColor,
                                            ),
                                          ),
                                          SizedBox(width: screenWidth * 0.02),
                                          Text(
                                            '90%',
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.03,
                                              color: ThirdColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.1,
                                    height: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffE6E6E6),
                                    ),
                                    child: Image.asset(
                                      "Assets/hand.png",
                                      width: screenWidth * 0.05,
                                      height: screenWidth * 0.05,
                                      color: KprimaryColor,
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.02),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.of(context).PartnerSince,
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.03,
                                          color: SecoundText,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '+4 ${S.of(context).years}',
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.03,
                                          color: ThirdColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            children: [
                              Container(
                                width: screenWidth * 0.1,
                                height: screenWidth * 0.1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffE6E6E6),
                                ),
                                child: Image.asset(
                                  "Assets/mdi_like.png",
                                  width: screenWidth * 0.05,
                                  height: screenWidth * 0.05,
                                  color: KprimaryColor,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).LatestReviews,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                      color: SecoundText,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    S.of(context).Positive,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                      color: SecoundText,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).ProductRatingsAndReviews,
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                              color: KprimaryText,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                              color: KprimaryText,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < 4 ? Icons.star : Icons.star_border,
                                color: KprimaryColor,
                                size: screenWidth * 0.05,
                              );
                            }),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            '${S.of(context).BasedOn_Prefix} 1000 ${S.of(context).Reviews_Suffix}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: SecoundText,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: reviews.length,
                            itemBuilder: (context, index) {
                              final review = reviews[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: screenWidth * 0.1,
                                          height: screenWidth * 0.1,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey,
                                          ),
                                          child: const Icon(Icons.person, color: Colors.white),
                                        ),
                                        SizedBox(width: screenWidth * 0.02),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              review['userName'] as String,
                                              style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              review['time'] as String,
                                              style: TextStyle(
                                                fontSize: screenWidth * 0.03,
                                                color: SecoundText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.005),
                                    Padding(
                                      padding: EdgeInsets.only(left: screenWidth * 0.12),
                                      child: Row(
                                        children: List.generate(
                                          5,
                                              (i) => Icon(
                                            i < (review['rating'] as double).floor() ? Icons.star : Icons.star_border,
                                            color: KprimaryColor,
                                            size: screenWidth * 0.05,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.02),
                                    Text(
                                      review['comment'] as String,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                        color: SecoundText,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      S.of(context).SimilarProducts,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                        color: KprimaryText,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
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
                    SizedBox(height: screenHeight * 0.08),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    height: screenWidth * 0.12,
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).Quantity,
                          style: TextStyle(
                            fontSize: screenWidth * 0.025,
                            color: KprimaryText,
                          ),
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                            color: KprimaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThirdColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: SizedBox(
                        height: screenWidth * 0.12,
                        child: Center(
                          child: Text(
                            S.of(context).AddToCart,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}