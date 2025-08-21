import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oemdoc/Feature/Home/presentation/view_model/views/widgets/SectionCategories.dart';
import 'package:oemdoc/Feature/Home/presentation/view_model/views/widgets/SectionHeader.dart';
import 'package:oemdoc/Feature/Home/presentation/view_model/views/widgets/SectionSearch.dart';
import 'package:oemdoc/Feature/Home/presentation/view_model/views/widgets/SectionService.dart';
import 'package:oemdoc/Feature/Home/presentation/view_model/views/widgets/SectionSuggestd.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: ListView(
          children: [
            Container(
              color: Colors.white,
              child: const Header(),
            ),
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.01),
                  const SectionService(),
                  SizedBox(height: screenHeight * 0.03),
                  const SectionSearch(),
                  SizedBox(height: screenHeight * 0.03),
                  Image.asset(
                    'Assets/Frame 20.png',
                    width: double.infinity,
                    height: screenWidth * 0.4,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  const SuggestedWidget(),
                  SizedBox(height: screenHeight * 0.01),
                  const Categories(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
