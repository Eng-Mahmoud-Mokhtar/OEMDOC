import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/SectionCategories.dart';
import 'widgets/SectionHeader.dart';
import 'widgets/SectionSearch.dart';
import 'widgets/SectionService.dart';
import 'widgets/SectionSuggested.dart';
import '../../../../AddCar/presentation/view_model/views/AddCarPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCar;

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
              child: Header(
                selectedCar: selectedCar,
                onCarTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddCarPage()),
                  );

                  if (result != null && result is String) {
                    setState(() {
                      selectedCar = result;
                    });
                  }
                },
              ),
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
