import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../Notification/presentation/view_model/views/Notification.dart';

class Header extends StatelessWidget {
  final String? userImage;
  const Header({super.key, this.userImage});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal:screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.02),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.11,
                    height: screenWidth * 0.11,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: userImage == null ? Colors.white : null,
                      image: userImage != null
                          ? DecorationImage(
                        image: NetworkImage(userImage!),
                        fit: BoxFit.cover,
                      )
                          : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: userImage == null
                        ? Icon(
                      Icons.person,
                      size: screenWidth * 0.05,
                      color: KprimaryText,
                    )
                        : null,
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Text(
                    S.of(context).HelloMahmoud,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(width: screenHeight * 0.01),
              IconButton(
                icon: Image.asset(
                  'Assets/Vector.png',
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  color: Colors.black,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationsPage()),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            width: screenWidth * 0.35,
            padding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.02,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  size: screenWidth * 0.05,
                  color: Color(0xff4D4D4D),
                ),
                SizedBox(width: screenWidth * 0.01),
                Text(
                  S.of(context).AddCar,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4D4D4D),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenWidth * 0.04),

        ],
      ),
    );
  }
}
