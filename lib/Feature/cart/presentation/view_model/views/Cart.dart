import 'package:flutter/material.dart';
import 'package:oemdoc/Feature/cart/presentation/view_model/views/widgets/buildSummaryRow.dart';
import '../../../../../../Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../Product/presentation/view_model/views/SuggerstedForYou.dart';
import '../CardData.dart';
import 'BuyOrder.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<CardData> cartItems = [
    CardData(
      productImage: "Assets/image 5.png",
      productName: "زيت ليكو مولي",
      quantity: 2,
      variant: "هيونداي سوناتا",
      price: "38 ${S.current.SYP}",
      totalPrice: "76 ${S.current.SYP}",
    ),
    CardData(
      productImage: "Assets/image 5.png",
      productName: "زيت محرك شيل",
      quantity: 1,
      variant: "تويوتا كورولا",
      price: "45 ${S.current.SYP}",
      totalPrice: "45 ${S.current.SYP}",
    ),
  ];

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (cartItems.isEmpty) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: SecoundColor,
        appBar: CustomAppBar(title: S.of(context).cart),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "Assets/empty-cart 1.png",
                  width: screenWidth * 0.5,
                  height: screenWidth * 0.5,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  S.of(context).emptyCart,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: KprimaryText,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  S.of(context).browseAndShopNow,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Products(),
                        ),
                      );                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KprimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: SizedBox(
                      height: screenWidth * 0.12,
                      child: Center(
                        child: Text(
                          S.of(context).browseProducts,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                            color: SecoundColor,
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
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: SecoundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).cart,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
            color: KprimaryText,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${S.of(context).Products} (${cartItems.length})",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final data = cartItems[index];
                          return Container(
                            margin: EdgeInsets.only(
                              bottom: screenWidth * 0.04,
                            ),
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade200),
                                      ),
                                      padding:
                                      EdgeInsets.all(screenWidth * 0.015),
                                      child: Image.asset(
                                        data.productImage,
                                        width: screenWidth * 0.15,
                                        height: screenWidth * 0.15,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.03),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.productName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.035,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: screenWidth * 0.015),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                  screenWidth * 0.025,
                                                  vertical: screenWidth * 0.01,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xffFEF6F5),
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  'x${data.quantity}',
                                                  style: TextStyle(
                                                    color: KprimaryColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: screenWidth * 0.025,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: screenWidth * 0.02),
                                              Expanded(
                                                child: Text(
                                                  data.variant,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: screenWidth * 0.03,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: screenWidth * 0.02),
                                              Text(
                                                data.price,
                                                style: TextStyle(
                                                  fontSize: screenWidth * 0.03,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.grey.shade300,
                                  thickness: 1,
                                  height: screenWidth * 0.05,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data.quantity} ${S.of(context).piece} | ${data.totalPrice}",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.w600,
                                        color: KprimaryColor,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => _removeItem(index),
                                      child: Image.asset(
                                        "Assets/trash-2.png",
                                        width: screenWidth * 0.05,
                                        height: screenWidth * 0.05,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    buildSummaryRow(
                        S.of(context).Subtotal, "121 ${S.of(context).SYP}", screenWidth),
                    SizedBox(height: screenWidth * 0.02),
                    buildSummaryRow(
                        S.of(context).Tax, "10 ${S.of(context).SYP}", screenWidth),
                    SizedBox(height: screenWidth * 0.02),
                    buildSummaryRow(
                        S.of(context).Deliverys, "15 ${S.of(context).SYP}", screenWidth),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                      height: screenWidth * 0.05,
                    ),
                    buildSummaryRow(
                        S.of(context).Total, "146 ${S.of(context).SYP}", screenWidth,
                        isTotal: true),
                    SizedBox(height: screenWidth * 0.04),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Products(),
                            ),
                          );                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.035),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: BorderSide(color: KprimaryColor, width: 1.5),
                        ),
                        child: Text(
                          S.of(context).AddAnotherOrder,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                            color: KprimaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.025),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BuyOrder(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: KprimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: SizedBox(
                        height: screenWidth * 0.12,
                        child: Center(
                          child: Text(
                            S.of(context).Checkout,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold,
                              color: SecoundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}