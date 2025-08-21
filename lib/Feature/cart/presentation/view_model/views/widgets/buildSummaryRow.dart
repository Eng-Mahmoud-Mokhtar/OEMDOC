import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../Core/utiles/Colors.dart';

Widget buildSummaryRow(
    String title, String value, double screenWidth,
    {bool isTotal = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.03,
          fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
          color: isTotal ? KprimaryText : Colors.black87,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: screenWidth * 0.03,
          fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
          color: isTotal ? KprimaryText : Colors.black87,
        ),
      ),
    ],
  );
}