import 'package:flutter/material.dart';
import 'package:oemdoc/Feature/CarHistory/presentation/view_model/views/widgets/fakeDatabase.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../../../../../generated/l10n.dart';
import 'CarhistoryDetail.dart';

class Carhistory extends StatefulWidget {
  const Carhistory({super.key});

  @override
  State<Carhistory> createState() => _CarhistoryState();
}

class _CarhistoryState extends State<Carhistory> {
  final TextEditingController _chassisController = TextEditingController();
  String chassisNumber = '';
  bool isLoading = false;

  @override
  void dispose() {
    _chassisController.dispose();
    super.dispose();
  }
  Future<Map<String, dynamic>?> fetchCarReport(String chassis) async {
    await Future.delayed(const Duration(seconds: 2));
    return fakeDatabase[chassis];
  }

  Future<void> showWarningDialog(String title, String message) {
    final screenWidth = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Row(
            crossAxisAlignment:CrossAxisAlignment.end,
            children: [
              Icon(Icons.error_outline,color: Color(0xff85939B),size: screenWidth * 0.05,),
              SizedBox(width: screenWidth * 0.01),
              Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          content: Text(
            message,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(
                S.of(context).Ok,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: KprimaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void getReport() async {
    final chassis = _chassisController.text.trim();

    if (chassis.isEmpty) {
      await showWarningDialog(S.of(context).warningTitle, S.of(context).enterChassis);
      return;
    }

    setState(() => isLoading = true);
    final result = await fetchCarReport(chassis);
    setState(() => isLoading = false);

    if (result == null) {
      await showWarningDialog(S.of(context).noDataTitle,S.of(context).noDataMessage);
      return;
    }

    if (!mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => CarhistoryDetail(report: result, chassis: chassis),
      ),
    );
  }

  void clearChassis() {
    setState(() {
      _chassisController.clear();
      chassisNumber = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: SecoundColor,
      appBar: CustomAppBar(title: S.of(context).carHistory),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenWidth * 0.04),
            Container(
              width: double.infinity,
              height: screenWidth * 0.45,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/Img - Negotiate a better deal.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.04),

            Text(
              S.of(context).discoverFullCarHistory,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: KprimaryText,
              ),
            ),
            SizedBox(height: screenWidth * 0.015),
            Text(
              S.of(context).carHistoryDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.w500,
                color: KprimaryText,
              ),
            ),
            SizedBox(height: screenWidth * 0.04),
            Container(
              height: screenWidth * 0.12,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextField(
                controller: _chassisController,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.text,
                onChanged: (val) => setState(() => chassisNumber = val),
                decoration: InputDecoration(
                  hintText: S.of(context).EnterChassisNumber,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.03,
                    horizontal: screenWidth * 0.02,
                  ),
                ),
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: KprimaryText,
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.04),
            SizedBox(
              width: double.infinity,
              height: screenWidth * 0.12,
              child: OutlinedButton(
                onPressed: isLoading ? null : getReport,
                style: OutlinedButton.styleFrom(
                  backgroundColor: KprimaryColor,
                  side: BorderSide(width: 2, color: KprimaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: isLoading
                    ? SizedBox(
                  width: screenWidth * 0.06,
                  height: screenWidth * 0.06,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.2,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                    : Text(
                  S.of(context).getReport,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.03),
            SizedBox(
              width: double.infinity,
              height: screenWidth * 0.12,
              child: OutlinedButton(
                onPressed: clearChassis,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1, color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).clearChassisNumber,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                        color: KprimaryText,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Image.asset(
                      'Assets/fluent_scan-camera-28-regular.png',
                      width: screenWidth * 0.05,
                      height: screenWidth * 0.05,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

