import 'package:flutter/material.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/utiles/Colors.dart';

class CarDetailsPage extends StatelessWidget {
  final String brand;
  final Map<String, List<Map<String, String>>> models;
  const CarDetailsPage({super.key, required this.brand, required this.models});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: SecoundColor,
      appBar: CustomAppBar(title: brand),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView(
            children: models.entries.map((entry) {
              final modelName = entry.key;
              final variants = entry.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    modelName,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  ...variants.map((variant) {
                    return InkWell(
                      onTap: () {
                        final fullCarName =
                            '$brand $modelName ${variant['name']} (${variant['year']})';
                        Navigator.pop(context, fullCarName);
                      },
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        child: Text(
                          '${variant['name']} (${variant['year']})',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  Divider(height: screenHeight * 0.03, thickness: 1),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
