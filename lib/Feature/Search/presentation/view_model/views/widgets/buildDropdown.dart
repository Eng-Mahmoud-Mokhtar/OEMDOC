import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildDropdown(
    double screenWidth,
    String hint,
    String? value,
    List<String> items,
    Function(String?) onChanged,
    String iconPath,
    ) {
  return Container(
    height: screenWidth * 0.12,
    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
    decoration: BoxDecoration(
      color: const Color(0xffFAFAFA),
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: const Color(0xff333333)),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: value,
        isExpanded: true,
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: screenWidth * 0.28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          offset: const Offset(0, 0),
        ),
        selectedItemBuilder: (context) {
          return items.map((e) {
            return Row(
              children: [
                Image.asset(
                  iconPath,
                  fit: BoxFit.contain,
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                ),
                SizedBox(width: screenWidth * 0.01),
                Expanded(
                  child: Text(
                    e,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            );
          }).toList();
        },
        hint: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              fit: BoxFit.contain,
              width: screenWidth * 0.05,
              height: screenWidth * 0.05,
            ),
            SizedBox(width: screenWidth * 0.01),
            Expanded(
              child: Text(
                hint,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
        ),
        items: items
            .map((e) => DropdownMenuItem(
          value: e,
          child: Text(
            e,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: Colors.black,
            ),
          ),
        ))
            .toList(),
        onChanged: onChanged,
      ),
    ),
  );
}