import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../generated/l10n.dart';

class CustomOrderTrackerStep extends StatelessWidget {
  final String title;
  final String dayMonth;
  final String time;
  final bool isActive;
  final bool isLast;
  final bool isFirst;

  const CustomOrderTrackerStep({
    super.key,
    required this.title,
    required this.dayMonth,
    required this.time,
    required this.isActive,
    required this.isLast,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: screenWidth * 0.03, horizontal: screenWidth * 0.04),
            decoration: BoxDecoration(
              color: const Color(0xffF6F6F5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.black : Colors.grey,
                fontSize: screenWidth * 0.03,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: screenWidth * 0.04,
                height: screenWidth * 0.03,
                decoration: BoxDecoration(
                  color: isActive ? KprimaryColor : const Color(0xffDEBEBF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            if (!isLast)
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 3,
                height: 50,
                color: isActive ? KprimaryColor : Colors.grey.shade300,
              ),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenWidth * 0.005),
              child: Text(
                dayMonth,
                style: TextStyle(
                  color: isActive ? Colors.black : Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.03,
                ),
              ),
            ),
            Text(
              time,
              style: TextStyle(
                color: Colors.grey,
                fontSize: screenWidth * 0.03,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class OrderTrackerWidget extends StatelessWidget {
  final List<Map<String, String>> steps;
  final int currentStep;

  const OrderTrackerWidget({super.key, required this.steps, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        return CustomOrderTrackerStep(
          title: steps[index]['title']!,
          dayMonth: steps[index]['dayMonth']!,
          time: steps[index]['time']!,
          isActive: index <= currentStep,
          isLast: index == steps.length - 1,
          isFirst: index == 0,
        );
      }),
    );
  }
}

class OrderTrackerDemo extends StatefulWidget {
  const OrderTrackerDemo({super.key});

  @override
  State<OrderTrackerDemo> createState() => _OrderTrackerDemoState();
}

class _OrderTrackerDemoState extends State<OrderTrackerDemo> {
  int currentStep = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentStep < 4) {
        setState(() {
          currentStep++;
        });
      } else {
        timer.cancel();
      }
    });
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final steps = [
      {'title': S.of(context).delivered, 'dayMonth': '17 يوليو', 'time': '15:45'},
      {'title': S.of(context).onTheWay, 'dayMonth': '17 يوليو', 'time': '09:30'},
      {'title': S.of(context).prepared, 'dayMonth': '16 يوليو', 'time': '21:20'},
      {'title': S.of(context).preparing, 'dayMonth': '16 يوليو', 'time': '21:00'},
      {'title': S.of(context).received, 'dayMonth': '16 يوليو', 'time': '20:50'},
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: S.of(context).DeliveryInformation),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).OrderNumber,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.03,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'MR "32-fd',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.03,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade100, thickness: 10),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: OrderTrackerWidget(
              steps: steps,
              currentStep: currentStep,
            ),
          ),
        ],
      ),
    );
  }
}