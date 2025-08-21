import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import 'package:oemdoc/Feature/Onboarding/presentation/view_model/views/Onboarding.dart';
import '../../../../../../Core/utiles/Images.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({super.key});

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _bgColorAnimation;
  late Animation<Color?> _logoColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.4).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );
    _bgColorAnimation = ColorTween(
      begin: const Color(0xffFCFCFC),
      end: KprimaryColor,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );
    _logoColorAnimation = ColorTween(
      begin: KprimaryColor,
      end: const Color(0xffFCFCFC),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );
    _controller.forward();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Onboarding()),
      );
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final baseSize = screenWidth * 0.5;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          color: _bgColorAnimation.value,
          child: Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                KprimaryImage,
                width: baseSize,
                height: baseSize,
                color: _logoColorAnimation.value,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
          ),
        );
      },
    );
  }
}
