import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../Notification/presentation/view_model/views/Notification.dart';

class Header extends StatelessWidget {
  final String? userImage;
  final String? selectedCar;
  final VoidCallback? onCarTap;

  const Header({
    super.key,
    this.userImage,
    this.selectedCar,
    this.onCarTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
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
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
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
                    MaterialPageRoute(
                        builder: (context) => NotificationsPage()),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          GestureDetector(
            onTap: onCarTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02, horizontal: screenWidth * 0.03),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    selectedCar == null ? Icons.add : Icons.directions_car,
                    size: screenWidth * 0.05,
                    color: Color(0xff4D4D4D),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    selectedCar ?? S.of(context).AddCar,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D4D4D),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
        ],
      ),
    );
  }
}
