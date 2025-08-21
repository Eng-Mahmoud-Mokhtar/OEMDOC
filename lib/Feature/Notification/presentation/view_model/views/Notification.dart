import 'package:flutter/material.dart';
import 'package:oemdoc/Core/Widgets/AppBar.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:SecoundColor,
      appBar: CustomAppBar(
        title: S.of(context).notificationsTitle),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                S.of(context).noNotifications,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: KprimaryText,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                S.of(context).exclusiveOffer,
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
                  onPressed: () {},
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
}
