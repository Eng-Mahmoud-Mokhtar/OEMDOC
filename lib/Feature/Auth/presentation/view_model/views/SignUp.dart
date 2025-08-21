import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import 'package:oemdoc/Feature/Auth/presentation/view_model/views/widgets/Name.dart';
import 'package:oemdoc/Feature/Auth/presentation/view_model/views/widgets/alreadyHaveAccount.dart';
import 'package:oemdoc/Feature/Auth/presentation/view_model/views/widgets/phoneNumber.dart';
import '../../../../../Core/Widgets/Button.dart';
import '../../../../../generated/l10n.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Center(
                    child: Image.asset(
                      "Assets/NativeLogo.png",
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.15,
                      color: KprimaryColor,

                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Name(),
                          SizedBox(height: screenHeight * 0.02),
                          const PhoneNumber(),
                          SizedBox(height: screenHeight * 0.02),
                          Button(
                            text: S.of(context).SignUp,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Login()),
                              );
                            },
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          const AlreadyHaveAccount(),
                        ],
                      ),
                    ],
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
