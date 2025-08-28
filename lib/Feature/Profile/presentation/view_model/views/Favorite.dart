import 'package:flutter/material.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../../SuggerstedForYou/presentation/view_model/Product.dart';
import '../../../../SuggerstedForYou/presentation/view_model/views/ProductDetailsPage.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<Product> favoriteProducts = [
    Product(
      imagePath: "Assets/image 5.png",
      title: "زيت ليكو مولي",
      subtitle: "تويوتا كورولا 45433689 زيت محرك",
      price: "120.00",
      oldPrice: "150.00",
      discount: "20%",
      category: "#زيوت",
      sellerName: "متجر السيارات",
      rating: 4.2,
      ratersCount: 120,
      comments: ["منتج ممتاز!", "يعمل بشكل جيد مع سيارتي."],
    ),
    Product(
      imagePath: "Assets/image 5.png",
      title: "فلتر هواء",
      subtitle: "فلتر محرك هيونداي",
      price: "45.00",
      oldPrice: "60.00",
      discount: "25%",
      category: "#فلاتر",
      sellerName: "متجر القطع",
      rating: 4.5,
      ratersCount: 85,
      comments: ["جودة عالية", "سهل التركيب"],
    ),
  ];

  void _removeFromFavorites(Product product) {
    setState(() {
      favoriteProducts.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: SecoundColor,
      appBar: CustomAppBar(title: S.of(context).favorite),
      body: favoriteProducts.isEmpty
          ? Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.5,
                height: screenWidth * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/empty 1.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                S.of(context).noFavorites,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: KprimaryText,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                S.of(context).startAddingFavorites,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: screenHeight * 0.12),
            ],
          ),
        ),
      )
          : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: screenWidth * 0.04,
                runSpacing: screenHeight * 0.02,
                children: favoriteProducts
                    .map(
                      (product) => SizedBox(
                    width: (screenWidth - screenWidth * 0.12) / 2,
                    child: ProductFav(
                      product: product,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onRemove: () => _removeFromFavorites(product),
                    ),
                  ),
                )
                    .toList(),
              ),
              SizedBox(height: screenHeight * 0.12),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductFav extends StatelessWidget {
  final Product product;
  final double screenWidth;
  final double screenHeight;
  final VoidCallback onRemove;

  const ProductFav({
    super.key,
    required this.product,
    required this.screenWidth,
    required this.screenHeight,
    required this.onRemove,
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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
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
                        Icons.favorite,
                        color: ThirdColor,
                        size: screenWidth * 0.07,
                      ),
                      onPressed: onRemove,
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
