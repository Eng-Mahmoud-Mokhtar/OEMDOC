import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Auth/presentation/view_model/views/login.dart';
import 'Widgets/OnboardingPage.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _skipToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  void _nextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _skipToLogin(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final locale = Localizations.localeOf(context);
    final isRtl = locale.languageCode == 'en';
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: KprimaryColor,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    children: [
                      OnboardingPage(
                        image: 'Assets/Car rental-rafiki 1.png',
                        title: S.of(context).OnBoarding1title,
                        description: S.of(context).OnBoarding1description,
                        onNextPressed: _nextPage,
                      ),
                      OnboardingPage(
                        image: 'Assets/Chat bot-pana 1.png',
                        title: S.of(context).OnBoarding2title,
                        description: S.of(context).OnBoarding2description,
                        onNextPressed: _nextPage,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _skipToLogin(context),
                    child: Text(
                      S.of(context).Skip,
                      style: TextStyle(
                        color: SecoundColor,
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(2, (index) {
                      int displayIndex = isRtl ? 1 - index : index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                        width: _currentPage == displayIndex
                            ? screenWidth * 0.02
                            : screenWidth * 0.06,
                        height: screenWidth * 0.02,
                        decoration: BoxDecoration(
                          color: _currentPage == displayIndex
                              ? SecoundColor
                              : const Color(0xffFF9666),
                          borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
