import 'package:flutter/material.dart';
import 'package:oemdoc/Core/Widgets/AppBar.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';
import 'OrderTracker.dart';

class DetailesOrder extends StatefulWidget {
  const DetailesOrder({super.key});

  @override
  State<DetailesOrder> createState() => _DetailesOrderState();
}

class _DetailesOrderState extends State<DetailesOrder> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: SecoundColor,
      appBar: CustomAppBar(title: S.of(context).orderDetails),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: const Color(0xFFFEFBEA),
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).orderDelivered,
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Text(
                            S.of(context).safetyLabelNote,
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Image.asset(
                      "Assets/IMG_3297-removebg-preview 1.png",
                      width: screenWidth * 0.2,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.04),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "سوريا - حمص",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.015),
                        Text(
                          "شارع كورسورر 21، 10437 حمص-سوريا",
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: const Color(0XFF4D4D4D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Image.asset(
                    "Assets/Icon.png",
                    width: screenWidth * 0.12,
                    height: screenWidth * 0.12,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.04),
              Divider(color: Colors.grey.shade200, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "Assets/done.png",
                        width: screenWidth * 0.06,
                        height: screenWidth * 0.06,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        "${S.of(context).deliveredAt} 1.05.2024, 15:42",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderTrackerDemo(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: KprimaryColor,
                      size: screenWidth * 0.05,
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey.shade200, thickness: 1),
              SizedBox(height: screenWidth * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).itemsInOrder,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${S.of(context).item} 1 ",
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.04),
              Divider(color: Colors.grey.shade200, thickness: 1),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.015),
                    child: Image.asset(
                      "Assets/image 5.png",
                      width: screenWidth * 0.15,
                      height: screenWidth * 0.15,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "زيت محرك موبيل",
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
                                horizontal: screenWidth * 0.025,
                                vertical: screenWidth * 0.01,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xffFEF6F5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'x 1',
                                style: TextStyle(
                                  color: KprimaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.025,
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              "750 مل   |   11.80 ل.س",
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                color: Colors.black87,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "60 ${S.of(context).SYP}",
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
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
              Divider(color: Colors.grey.shade200, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).orderTotal,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black54,
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: KprimaryColor,
                        size: screenWidth * 0.07,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey.shade200, thickness: 1),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Column(
                  children: [
                    SizedBox(height: screenWidth * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).OrderNumber,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.black54,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "M2Z4-VVY2",
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                S.of(context).copy,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: KprimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).paymentTime,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "16.07.2022، 19:47",
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).orderTime,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "16.07.2022، 20:47",
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).shippingTime,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "16.07.2022، 20:47",
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).completionTime,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "16.07.2022، 20:53",
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    Divider(color: Colors.grey.shade200, thickness: 1),
                    SizedBox(height: screenWidth * 0.02),
                  ],
                ),
                crossFadeState:
                    isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: KprimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: SizedBox(
                  height: screenWidth * 0.12,
                  child: Center(
                    child: Text(
                      S.of(context).reorder,
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
              SizedBox(height: screenWidth * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
