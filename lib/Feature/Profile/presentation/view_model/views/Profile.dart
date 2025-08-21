import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import 'package:oemdoc/Feature/Profile/presentation/view_model/views/widgets/buildLanguage.dart';
import 'package:oemdoc/Feature/Profile/presentation/view_model/views/widgets/buildProfileOption.dart';
import 'package:oemdoc/Feature/Profile/presentation/view_model/views/widgets/buildRatingOption.dart';
import 'package:oemdoc/generated/l10n.dart';
import '../../../../../Core/utiles/LocaleCubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<Widget> profileItems(BuildContext context, Locale locale) => [
      buildProfileOption(
        context,
        label: S.of(context).editProfile,
        imagePath: 'Assets/ثيهف.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        onTap: () {},
      ),
      buildProfileOption(
        context,
        label: S.of(context).myShipments,
        imagePath: 'Assets/sops.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        onTap: () {},
      ),
      buildProfileOption(
        context,
        label: S.of(context).favoriteProducts,
        imagePath: 'Assets/solar_heart-outline.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        onTap: () {},
      ),
      buildProfileOption(
        context,
        label: S.of(context).addresses,
        imagePath: 'Assets/location.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        onTap: () {},
      ),
      buildProfileOption(
        context,
        label: S.of(context).settings,
        imagePath: 'Assets/Property 1=setting.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        onTap: () {},
      ),
      buildProfileOption(
        context,
        label: 'Comfra Community',
        imagePath: 'Assets/fluent_people-community-32-regular.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        onTap: () {},
      ),
      buildLanguageSwapOption(
        context,
        locale: locale,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
      ),
      buildProfileOption(
        context,
        label: S.of(context).coupons,
        imagePath: 'Assets/mdi_coupon-outline.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        onTap: () {},
      ),
      buildProfileOption(
        context,
        label: S.of(context).support,
        imagePath: 'Assets/streamline-plump_customer-support-3.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        onTap: () {},
      ),
      buildRatingOption(
        label: S.of(context).rateApp,
        imagePath: 'Assets/stars.png',
        rating: 4,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        onTap: () {},
      ),
      buildProfileOption(
        context,
        label: S.of(context).logout,
        imagePath: 'Assets/log-out.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        onTap: () {},
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).profile,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
            color: KprimaryText,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) {
            final TextDirection textDirection =
            (locale.languageCode == 'ar') ? TextDirection.rtl : TextDirection.ltr;
            final items = profileItems(context, locale);

            return Directionality(
              textDirection: textDirection,
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                decoration: BoxDecoration(
                  color: SecoundColor,
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                ),
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => Divider(
                    color: Colors.grey.shade100,
                    thickness: 1,
                    height: screenHeight * 0.01,
                  ),
                  itemBuilder: (context, index) => items[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
