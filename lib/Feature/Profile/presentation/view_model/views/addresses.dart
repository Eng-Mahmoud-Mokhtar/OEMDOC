import 'package:flutter/material.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/Widgets/Button.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import '../../../../../generated/l10n.dart';

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
    final screenHeight = MediaQuery.of(context).size.height;

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

class SelectAddressPage extends StatefulWidget {
  final Map<String, String>? oldData;
  const SelectAddressPage({super.key, this.oldData});

  @override
  State<SelectAddressPage> createState() => _SelectAddressPageState();
}

class _SelectAddressPageState extends State<SelectAddressPage> {
  String type = "home";
  final TextEditingController city = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController building = TextEditingController();
  final TextEditingController floor = TextEditingController();
  final TextEditingController flat = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.oldData != null) {
      type = widget.oldData!["title"] ?? "home";
      city.text = widget.oldData!["city"] ?? "";
      street.text = widget.oldData!["street"] ?? "";
      building.text = widget.oldData!["building"] ?? "";
      floor.text = widget.oldData!["floor"] ?? "";
      flat.text = widget.oldData!["flat"] ?? "";
      description.text = widget.oldData!["description"] ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CustomAppBar(title: S.of(context).addAddress),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => setState(() => type = "home"),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, screenWidth * 0.12)),
                        backgroundColor: MaterialStateProperty.all(
                            type == "home" ? KprimaryColor : Colors.transparent),
                        side: MaterialStateProperty.all(
                          BorderSide(color: KprimaryColor, width: 1.5),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "Assets/Component 2 (1).png",
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                            fit: BoxFit.contain,
                            color: type == "home" ? Colors.white : KprimaryColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            S.of(context).home,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.03,
                              color: type == "home" ? Colors.white : KprimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.025),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => setState(() => type = "work"),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, screenWidth * 0.12)),
                        backgroundColor: MaterialStateProperty.all(
                            type == "work" ? KprimaryColor : Colors.transparent),
                        side: MaterialStateProperty.all(
                          BorderSide(color: KprimaryColor, width: 1.5),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "Assets/Component 2.png",
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                            fit: BoxFit.contain,
                            color: type == "work" ? Colors.white : KprimaryColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            S.of(context).work,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.03,
                              color: type == "work" ? Colors.white : KprimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.025),
              buildField(S.of(context).city, city, screenWidth,
                  hint: S.of(context).city),
              buildField(S.of(context).street, street, screenWidth,
                  hint: S.of(context).street),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: buildField(
                          S.of(context).buildingNumber, building, screenWidth,
                          hint:S.of(context).Number, isNumber: true)),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                      child: buildField(S.of(context).floorNumber, floor,
                          screenWidth,
                          hint: S.of(context).Number, isNumber: true)),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                      child: buildField(S.of(context).flatNumber, flat,
                          screenWidth,
                          hint:S.of(context).Number, isNumber: true)),
                ],
              ),
              buildField(S.of(context).description, description, screenWidth,
                  hint: S.of(context).description, maxLines: 3),
              SizedBox(height: screenHeight * 0.03),
              Button(
                onPressed: () {
                  Navigator.pop(context, {
                    "title": type,
                    "city": city.text,
                    "street": street.text,
                    "building": building.text,
                    "floor": floor.text,
                    "flat": flat.text,
                    "description": description.text,
                  });
                },
                text: S.of(context).saveAddress,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(
      String label,
      TextEditingController controller,
      double screenWidth, {
        int maxLines = 1,
        String? hint,
        bool isNumber = false,
      }) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.03,
                  color: Colors.black)),
          SizedBox(height: screenWidth * 0.015),
          SizedBox(
            height: screenWidth * 0.12,
            child: TextField(
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              controller: controller,
              maxLines: maxLines,
              keyboardType:
              isNumber ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffFAFAFA),
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.035,
                    horizontal: screenWidth * 0.035),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xff333333)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: KprimaryColor, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xff333333)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

