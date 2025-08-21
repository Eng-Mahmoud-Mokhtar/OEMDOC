import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import 'package:oemdoc/generated/l10n.dart';
import '../../../../../Core/utiles/LocaleCubit.dart';

class ActionPage extends StatelessWidget {
  const ActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: _buildCenterPage(Icons.add_circle, "action", "Perform quick actions here"),
    );
  }
}
Widget _buildCenterPage(IconData icon, String title, String subtitle) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 50, color: KprimaryColor),
        const SizedBox(height: 16),
        Text(
          title,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: KprimaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textDirection: TextDirection.rtl,
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ],
    ),
  );
}