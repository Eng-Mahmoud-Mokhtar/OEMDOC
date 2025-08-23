import 'package:flutter/material.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../../../../../generated/l10n.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: SecoundColor,
      appBar: CustomAppBar(
        title: S.of(context).support,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            Expanded(
              child: _buildContactTab(screenWidth),
            ),
          ],
        ),
      ),
    );
  }

  /// ===== تواصل معنا =====
  Widget _buildContactTab(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:screenWidth * 0.04),
      child: Column(
        children: [
          _buildContactItem("Assets/whatsapp.png", S.of(context).whatsapp),
          const SizedBox(height: 15),
          _buildContactItem("Assets/image 6.png", S.of(context).webSite),
        ],
      ),
    );
  }

  Widget _buildContactItem(String imagePath, String title) {
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(imagePath,
                width: screenWidth * 0.07, height: screenWidth * 0.07,
            fit: BoxFit.contain,),
            const SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: KprimaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
