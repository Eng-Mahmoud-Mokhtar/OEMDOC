import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../../../../../generated/l10n.dart';

class CarhistoryDetail extends StatelessWidget {
  final Map<String, dynamic> report;
  final String chassis;

  const CarhistoryDetail({
    super.key,
    required this.report,
    required this.chassis,
  });

  Widget _buildRow(String label, String value, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = screenWidth * 0.035;

    String _safe(String? v) =>
        (v == null || v.toString().isEmpty) ? '-' : v.toString();

    return Scaffold(
      backgroundColor: SecoundColor,
      appBar: CustomAppBar(title: S.of(context).carHistory),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      backgroundColor: Colors.black,
                      appBar: AppBar(
                        backgroundColor: Colors.black,
                        iconTheme: const IconThemeData(color: Colors.white),
                      ),
                      body: Center(
                        child: InteractiveViewer(
                          panEnabled: true,
                          minScale: 0.5,
                          maxScale: 4,
                          child: Image.asset(
                            report['image'] ?? 'Assets/f7_car-fill.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: screenWidth * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(report['image'] ?? 'Assets/placeholder.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.04),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).carHistoryDetails,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: KprimaryText,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.03),
                  _buildRow('رقم الشاسيه:', chassis, fontSize),
                  _buildRow('VIN:', _safe(report['vin']), fontSize),
                  _buildRow('الماركة:', _safe(report['brand']), fontSize),
                  _buildRow('الموديل:', _safe(report['model']), fontSize),
                  _buildRow('سنة الصنع:', _safe(report['year']), fontSize),
                  _buildRow('اللون:', _safe(report['color']), fontSize),
                  _buildRow('عدد الكيلومترات:', _safe(report['mileage']), fontSize),
                  _buildRow('عدد الحوادث:', _safe(report['accidents']?.toString()), fontSize),
                  _buildRow('عدد الملاك :', _safe(report['owners']?.toString()), fontSize),
                  _buildRow('التسجيل:', _safe(report['registration']), fontSize),

                  SizedBox(height: screenWidth * 0.03),
                  Text(
                    'سجل الصيانة:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (report['serviceHistory'] is List &&
                      (report['serviceHistory'] as List).isNotEmpty)
                    ...((report['serviceHistory'] as List).map((e) {
                      final date = e['date'] ?? '-';
                      final note = e['note'] ?? '-';
                      return _buildRow(date.toString(), note.toString(), fontSize);
                    }).toList())
                  else
                    Text('-', style: TextStyle(fontSize: fontSize)),
                  SizedBox(height: screenWidth * 0.03),
                  Text(
                    'ملاحظات الكشف:',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _safe(report['notes']),
                    style: TextStyle(fontSize: fontSize),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
