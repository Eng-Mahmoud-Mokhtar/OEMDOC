import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';

import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../generated/l10n.dart';

class CountrySelectionPage extends StatelessWidget {
  final String? selectedCountry;

  const CountrySelectionPage({super.key, this.selectedCountry});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final List<Map<String, String>> countries = [
      {'name': 'سوريا', 'flag': 'Assets/صورة-علم-سوريا-الجديد-xva4bp.png'},
      {'name': 'الاردن', 'flag': 'Assets/Jordan (JO).png'},
      {'name': 'لبنان', 'flag': 'Assets/Lebanon (LB).png'}
    ];

    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).SelectCountry),
      backgroundColor: SecoundColor,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: countries.length,
                separatorBuilder: (_, __) =>
                    Divider(color: Colors.grey.shade300, thickness: 1),
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context, country);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                        horizontal: screenWidth * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: country['name'] == selectedCountry
                            ? KprimaryColor.withOpacity(0.2)
                            : Colors.white,
                        borderRadius:
                        BorderRadius.circular(screenWidth * 0.02),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            country['flag']!,
                            width: screenWidth * 0.06,
                            height: screenWidth * 0.06,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            country['name']!,
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                              color: KprimaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
