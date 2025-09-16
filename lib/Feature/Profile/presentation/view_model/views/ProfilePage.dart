import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import 'package:oemdoc/Feature/Auth/presentation/view_model/views/login.dart';
import 'package:oemdoc/Feature/MyShipment/presentation/view_model/views/MyShipmentsPage.dart';
import 'package:oemdoc/Feature/Profile/presentation/view_model/views/Conforma.dart';
import 'package:oemdoc/Feature/Profile/presentation/view_model/views/Support.dart';
import 'package:oemdoc/Feature/Profile/presentation/view_model/views/widgets/buildProfileOption.dart';
import 'package:oemdoc/Feature/Profile/presentation/view_model/views/widgets/buildRatingOption.dart';
import 'package:oemdoc/generated/l10n.dart';
import 'CountrySelection.dart';
import 'Coupons.dart';
import 'EditProfile.dart';
import 'Favorite.dart';
import 'Setting.dart';
import 'addresses.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, String>? selectedCountry;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<Widget> profileItems(BuildContext context) => [
      buildProfileOption(
        context,
        label: S.of(context).editProfile,
        imagePath: 'Assets/ثيهف.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        page: const EditProfile(),
      ),
      buildProfileOption(
        context,
        label: S.of(context).myShipments,
        imagePath: 'Assets/sops.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        page: const MyShipmentsPage(),
      ),
      buildProfileOption(
        context,
        label: S.of(context).favoriteProducts,
        imagePath: 'Assets/solar_heart-outline.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        page: const Favorite(),
      ),
      buildProfileOption(
        context,
        label: S.of(context).addresses,
        imagePath: 'Assets/location.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        page: const Addresses(),
      ),
      buildProfileOption(
        context,
        label: S.of(context).settings,
        imagePath: 'Assets/Property 1=setting.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        page: const SettingsPage(),
      ),
      buildProfileOption(
        context,
        label: S.of(context).comfraCommunity,
        imagePath: 'Assets/fluent_people-community-32-regular.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        page: const Conforma(),
      ),
      GestureDetector(
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountrySelectionPage(
                selectedCountry: selectedCountry?['name'],
              ),
            ),
          );

          if (result != null) {
            setState(() {
              selectedCountry = {
                'name': result['name'],
                'flag': result['flag'],
              };
            });
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.015,
          ),
          decoration: BoxDecoration(
            color: SecoundColor,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/tabler_world.png',
                width: screenWidth * 0.05,
                height: screenWidth * 0.05,
                fit: BoxFit.contain,
              ),
              SizedBox(width: screenWidth * 0.03),
              Text(
                S.of(context).country,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w500,
                  color: KprimaryText,
                ),
              ),
              const Spacer(),
              if (selectedCountry != null &&
                  selectedCountry?['flag'] != null)
                CircleAvatar(
                  radius: screenWidth * 0.03,
                  backgroundImage: AssetImage(selectedCountry!['flag']!),
                )
              else
                CircleAvatar(
                  radius: screenWidth * 0.03,
                  backgroundColor: Colors.white, // أبيض ومش باين
                ),
              SizedBox(width: screenWidth * 0.02),
              Icon(Icons.arrow_forward_ios,
                  size: screenWidth * 0.045, color: Colors.black),
            ],
          ),
        ),
      ),
      buildProfileOption(
        context,
        label: S.of(context).coupons,
        imagePath: 'Assets/mdi_coupon-outline.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        page: const Coupons(),
      ),
      buildProfileOption(
        context,
        label: S.of(context).support,
        imagePath: 'Assets/streamline-plump_customer-support-3.png',
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        page: const Support(),
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
        page: Login(),
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
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.03),
          decoration: BoxDecoration(
            color: SecoundColor,
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          child: ListView.separated(
            itemCount: profileItems(context).length,
            separatorBuilder: (_, __) => Divider(
              color: Colors.grey.shade100,
              thickness: 1,
              height: screenHeight * 0.01,
            ),
            itemBuilder: (context, index) => profileItems(context)[index],
          ),
        ),
      ),
    );
  }
}
