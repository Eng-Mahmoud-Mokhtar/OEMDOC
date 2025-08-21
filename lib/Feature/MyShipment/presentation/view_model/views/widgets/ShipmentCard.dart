import 'package:flutter/material.dart';
import '../../../../../../Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../ShipmentCardData.dart';
import '../DetailesOrder.dart';

class ShipmentCard extends StatelessWidget {
  final ShipmentCardData data;
  const ShipmentCard({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.grey.shade100, thickness: 1, height: 0),
        SizedBox(height: screenWidth * 0.03),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    data.isCancelled
                        ? Icon(
                      Icons.error_outline,
                      color: Colors.grey,
                      size: screenWidth * 0.06,
                    )
                        : Image.asset(
                      data.statusIcon,
                      width: screenWidth * 0.06,
                      height: screenWidth * 0.06,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: Text(
                        data.statusText,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: data.statusColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.025,
                  vertical: screenWidth * 0.015,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffe9eff1)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  data.shipmentNumber,
                  style: TextStyle(
                    color: ThirdColor,
                    fontSize: screenWidth * 0.028,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        Divider(color: Colors.grey.shade200, thickness: 1 ),
        SizedBox(height: screenWidth * 0.03),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200),
                ),
                padding: EdgeInsets.all(screenWidth * 0.015),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.productName,
                        style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.bold)),
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
                            'x${data.quantity}',
                            style: TextStyle(
                              color: KprimaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth * 0.025,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          data.variant,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.black87,
                          ),
                        ),
                        const Spacer(),
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
        ),
        SizedBox(height: screenWidth * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Divider(color: Colors.grey.shade300, thickness: 1),
        ),
        SizedBox(height: screenWidth * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${data.quantity} ${S.of(context).piece} | ${data.totalPrice}",
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w600,
                  color: KprimaryColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailesOrder(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: screenWidth * 0.05,
                  color: KprimaryColor,
                ),
              ),

            ],
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        Divider(color: Colors.grey.shade100, thickness: 1),
        SizedBox(height: screenWidth * 0.04),
      ],
    );
  }
}
