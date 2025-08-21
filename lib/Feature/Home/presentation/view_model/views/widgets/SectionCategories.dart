import 'package:flutter/material.dart';
import '../../../../../../Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  final List<Map<String, String>> categoriesData = const [
    {"logo": "Assets/Categories/Group.png", "key": "Chassis", "results": "500"},
    {"logo": "Assets/Categories/mingcute_engine-line.png", "key": "Engine", "results": "350"},
    {"logo": "Assets/Categories/Vector.png", "key": "Cooling", "results": "354"},
    {"logo": "Assets/Categories/vaadin_disc.png", "key": "SuspensionAndAlignment", "results": "941"},
    {"logo": "Assets/Categories/ri_oil-line.png", "key": "Oils", "results": "168"},
    {"logo": "Assets/Categories/Vector (1).png", "key": "Transmission", "results": "157"},
    {"logo": "Assets/Categories/Group (2).png", "key": "Filters", "results": "679"},
    {"logo": "Assets/Categories/ic_outline-electric-car.png", "key": "ElectricalAndElectronics", "results": "676"},
    {"logo": "Assets/Categories/mynaui_fire.png", "key": "Exhaust", "results": "344"},
    {"logo": "Assets/Categories/Vector (2).png", "key": "MaintenanceAndService", "results": "187"},
    {"logo": "Assets/Categories/Vector (3).png", "key": "InstallationTools", "results": "54"},
    {"logo": "Assets/Categories/Vector (4).png", "key": "Accessories", "results": "3214"},
  ];

  String getCategoryName(BuildContext context, String key) {
    switch (key) {
      case "Chassis": return S.of(context).Chassis;
      case "Engine": return S.of(context).Engine;
      case "Cooling": return S.of(context).Cooling;
      case "SuspensionAndAlignment": return S.of(context).SuspensionAndAlignment;
      case "Oils": return S.of(context).Oils;
      case "Transmission": return S.of(context).Transmission;
      case "Filters": return S.of(context).Filters;
      case "ElectricalAndElectronics": return S.of(context).ElectricalAndElectronics;
      case "Exhaust": return S.of(context).Exhaust;
      case "MaintenanceAndService": return S.of(context).MaintenanceAndService;
      case "InstallationTools": return S.of(context).InstallationTools;
      case "Accessories": return S.of(context).Accessories;
      default: return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).Categories,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
            color: KprimaryText,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Column(
          children: categoriesData.map((category) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: screenWidth * 0.13,
                        height: screenWidth * 0.13,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          child: Image.asset(
                            category["logo"]!,
                            color: Colors.black,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getCategoryName(context, category["key"]!),
                            style: TextStyle(
                              color: KprimaryText,
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${category["results"]} ${S.of(context).Product}",
                            style: TextStyle(
                              fontSize: screenWidth * 0.028,
                              color: KprimaryText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Directionality(
                    textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: KprimaryText,
                      size: screenWidth * 0.05,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
