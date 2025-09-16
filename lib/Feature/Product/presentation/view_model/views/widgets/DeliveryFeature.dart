import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryFeature extends StatelessWidget {
  final String imagePath;
  final String label;
  final double screenWidth;

  const DeliveryFeature({
    required this.imagePath,
    required this.label,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(screenWidth * 0.02),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Image.asset(
            imagePath,
            width: screenWidth * 0.07,
            height: screenWidth * 0.07,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: screenWidth * 0.015),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth * 0.2,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: Colors.black87,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}