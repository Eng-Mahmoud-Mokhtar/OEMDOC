import 'package:flutter/material.dart';
import 'package:oemdoc/Feature/Auth/presentation/view_model/views/widgets/dontHaveAccountRow.dart';
import 'package:oemdoc/Feature/Auth/presentation/view_model/views/widgets/phoneNumber.dart';
import '../../../../../Core/Widgets/Button.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../../../../../generated/l10n.dart';
import 'Reset Code.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: SecoundColor,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Image.asset(
                    "Assets/NativeLogo.png",
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.15,
                    fit: BoxFit.contain,
                    color: KprimaryColor,
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  const PhoneNumber(),
                  SizedBox(height: screenHeight * 0.03),
                  Button(
                    text: S.of(context).login,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ResetCode()),
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  const CreateAccount(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
