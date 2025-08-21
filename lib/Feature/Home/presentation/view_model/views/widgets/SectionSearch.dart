import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';

class SectionSearch extends StatefulWidget {
  const SectionSearch({super.key});

  @override
  State<SectionSearch> createState() => _SectionSearchState();
}

class _SectionSearchState extends State<SectionSearch> {
  bool _showCards = false;
  bool _isMenuOpen = false;
  String chassisNumber = '';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
              S.of(context).ChooseYourCar,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: KprimaryText,
                ),
                maxLines: 1,
                overflow: TextOverflow.visible,
              ),
            ),
            PopupMenuButton<String>(
              offset: Offset(0, screenWidth * 0.08),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              color: const Color(0xffE6E6E6),
              elevation: 0,
              constraints: BoxConstraints(
                minWidth: screenWidth * 0.35,
                maxWidth: screenWidth * 0.35,
              ),
              onOpened: () {
                setState(() {
                  _isMenuOpen = true;
                });
              },
              onCanceled: () {
                setState(() {
                  _isMenuOpen = false;
                });
              },
              onSelected: (String value) {
                setState(() {
                  _showCards = value == 'manual';
                  _isMenuOpen = false;
                });
              },
              child: Container(
                width: screenWidth * 0.35,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenWidth * 0.02,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffE6E6E6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).SearchType,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w600,
                        color: KprimaryText,
                      ),
                    ),
                    Icon(
                      _isMenuOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: screenWidth * 0.05,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  height: screenHeight * 0.04,
                  value: 'chassis',
                  child: Text(
                    S.of(context).ChassisNumber,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                      color: KprimaryText,
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  height: screenHeight * 0.04,
                  value: 'manual',
                  child: Text(
                    S.of(context).Manual,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                      color: KprimaryText,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: screenHeight * 0.03),
        !_showCards
            ? _buildChassisField(screenWidth)
            : Column(
          children: [
            _buildSearchCard(S.of(context).ChooseBrand, screenWidth, 1),
            _buildSearchCard(S.of(context).ChooseModel, screenWidth, 2),
            _buildSearchCard(S.of(context).ChooseEngine, screenWidth, 3),
          ],
        ),

        SizedBox(height: screenHeight * 0.02),
        ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ThirdColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: SizedBox(
            height: screenWidth * 0.12,
            child: Center(
              child: Text(
                S.of(context).Search,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                  color: SecoundColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChassisField(double screenWidth) {
    return Container(
      height: screenWidth * 0.12,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: TextField(
        textAlign: TextAlign.start,
        keyboardType: TextInputType.number,
        onChanged: (val) => chassisNumber = val,
        decoration: InputDecoration(
          hintText: S.of(context).EnterChassisNumber,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.03,horizontal: screenWidth * 0.02),
        ),
        style: TextStyle(
          fontSize: screenWidth * 0.03,
          color: KprimaryText,
        ),

      ),
    );
  }

  Widget _buildSearchCard(String title, double screenWidth, int index) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Container(
      height: screenWidth * 0.12,
      margin: EdgeInsets.only(bottom: screenWidth * 0.02),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.035,
            backgroundColor: Colors.grey.shade300,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '$index',
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff858585),
                  height: 1,
                ),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Text(
              title,
              textAlign: isRtl ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.w500,
                color: KprimaryText,
              ),
            ),
          ),

          Icon(
            Icons.keyboard_arrow_down_outlined,
            size: screenWidth * 0.05,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
