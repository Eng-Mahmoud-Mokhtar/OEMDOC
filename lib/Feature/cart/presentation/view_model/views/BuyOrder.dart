import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import 'package:oemdoc/generated/l10n.dart';

import '../../../../../Core/Widgets/AppBar.dart';

class BuyOrder extends StatefulWidget {
  const BuyOrder({super.key});

  @override
  _BuyOrderState createState() => _BuyOrderState();
}

class _BuyOrderState extends State<BuyOrder> {
  bool isCashSelected = true;
  bool isVisaSelected = false;
  bool isCouponExpanded = false;
  final TextEditingController _couponController = TextEditingController();

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  void _togglePaymentMethod(bool isCash) {
    setState(() {
      if (isCash) {
        isCashSelected = true;
        isVisaSelected = false;
      } else {
        isCashSelected = false;
        isVisaSelected = true;
      }
    });
  }

  void _toggleCouponField() {
    setState(() {
      isCouponExpanded = !isCouponExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: SecoundColor,
      appBar: CustomAppBar(title: S.of(context).orderDetails),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Center(
            child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).deliveryTo,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  GestureDetector(
                    onTap: () {
                      // Navigate to address selection
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: KprimaryColor,
                          size: screenWidth * 0.05,
                        ),
                        Text(
                          S.of(context).addAddress,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: KprimaryColor,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: KprimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  Text(
                    S.of(context).paymentMethod,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Column(
                    children: [
                      Container(
                        height: screenWidth * 0.12,
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).cash,
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.09,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Checkbox(
                                  value: isCashSelected,
                                  onChanged: (value) {
                                    _togglePaymentMethod(true);
                                  },
                                  activeColor: KprimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Container(
                        height: screenWidth * 0.12,
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).visa,
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.09,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Checkbox(
                                  value: isVisaSelected,
                                  onChanged: (value) {
                                    _togglePaymentMethod(false);
                                  },
                                  activeColor: KprimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  GestureDetector(
                    onTap: _toggleCouponField,
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).addCoupon,
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            isCouponExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            size: screenWidth * 0.05,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isCouponExpanded) ...[
                    SizedBox(height: screenWidth * 0.04),
                    SizedBox(
                      height: screenWidth * 0.12,
                      child: TextField(
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: KprimaryText,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _couponController,
                        decoration: InputDecoration(
                          hintText: S.of(context).enterCouponCode,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey.shade200),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: KprimaryColor),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.035,
                            horizontal: screenWidth * 0.035,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.04),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Apply coupon logic
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
                              S.of(context).applyDiscount,
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
                  SizedBox(height: screenWidth * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).subtotal,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4D4D4D),
                        ),
                      ),
                      Text(
                        "121 ${S.of(context).SYP}",
                        style: TextStyle(
                          color: Color(0xff4D4D4D),
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).discount,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4D4D4D),
                        ),
                      ),
                      Text(
                        "0 ${S.of(context).SYP}",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4D4D4D),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  Divider(
                    color: KprimaryText,
                    thickness: 1,
                    height: screenWidth * 0.05,
                  ),
                  SizedBox(height: screenWidth * 0.04),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).total,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "121 ${S.of(context).SYP}",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Complete purchase logic
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
                            S.of(context).completePurchase,
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
        ),
      ),
    );
  }
}
