import 'package:flutter/material.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/Widgets/Button.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import '../../../../../generated/l10n.dart';
import 'Select addresses.dart';

class Addresses extends StatefulWidget {
  const Addresses({super.key});

  @override
  State<Addresses> createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
  List<Map<String, String>> addresses = [
    {
      "title": "home",
      "city": "القاهرة",
      "street": "مدينة نصر - شارع الطيران",
      "building": "12",
      "floor": "3",
      "flat": "5",
      "description": "قريب من النادي"
    },
    {
      "title": "work",
      "city": "الجيزة",
      "street": "المهندسين - جامعة الدول",
      "building": "20",
      "floor": "4",
      "flat": "12",
      "description": "مكتب الدور الرابع"
    },
  ];

  void addAddress(Map<String, String> newAddress) {
    setState(() {
      addresses.add(newAddress);
    });
  }

  void editAddress(int index, Map<String, String> newAddress) {
    setState(() {
      addresses[index] = newAddress;
    });
  }

  void deleteAddress(int index) {
    setState(() {
      addresses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(title: S.of(context).addresses),
      body: addresses.isEmpty
          ? Center(
        child: Container(
          width: screenWidth * 0.92,
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: screenWidth * 0.5,
                height: screenWidth * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'Assets/Map with marked routes and locations.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                S.of(context).noSavedAddresses,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: KprimaryText,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                S.of(context).addAddressesInfo,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: KprimaryText.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              Divider(color: Colors.grey.shade200, thickness: 1),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: double.infinity,
                child: Button(
                  onPressed: () async {
                    final newAddress = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SelectAddressPage(),
                      ),
                    );
                    if (newAddress != null) addAddress(newAddress);
                  },
                  text: S.of(context).addAddress,
                ),
              ),
            ],
          ),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(screenWidth * 0.04),
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final item = addresses[index];
                return Column(
                  children: [
                    buildAddressCard(
                      context,
                      index: index,
                      data: item,
                    ),
                    SizedBox(height: screenWidth * 0.04),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: screenWidth * 0.08),
            child: SizedBox(
              width: double.infinity,
              child: Button(
                onPressed: () async {
                  final newAddress = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SelectAddressPage(),
                    ),
                  );
                  if (newAddress != null) addAddress(newAddress);
                },
                text:S.of(context).addAddress,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddressCard(BuildContext context,
      {required int index, required Map<String, String> data}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final addressText =
        "${data["city"]}, ${data["street"]}, ${S.of(context).buildingNumber} ${data["building"]}, ${S.of(context).floorNumber} ${data["floor"]}, ${S.of(context).flatNumber} ${data["flat"]}\n${S.of(context).description}: ${data["description"]}";

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: KprimaryColor,
                size: screenWidth * 0.05,
              ),
              SizedBox(width: screenWidth * 0.02),
              Text(
                data["title"] == "home" ? S.of(context).home : S.of(context).work,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: KprimaryText,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => deleteAddress(index),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  child: Image.asset(
                    "Assets/trash-2.png",
                    width: screenWidth * 0.05,
                    height: screenWidth * 0.05,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.03),
          Text(
            addressText,
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: KprimaryText,
            ),
          ),
          SizedBox(height: screenWidth * 0.03),
          Button(
            onPressed: () async {
              final newAddress = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SelectAddressPage(oldData: data),
                ),
              );
              if (newAddress != null) editAddress(index, newAddress);
            },
            text: S.of(context).edit,
          ),

        ],
      ),
    );
  }
}



