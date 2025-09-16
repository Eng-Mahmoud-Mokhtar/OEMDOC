import 'package:flutter/material.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/Widgets/Button.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../../../../../generated/l10n.dart';

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