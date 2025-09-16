import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import 'package:oemdoc/Feature/AddCar/presentation/view_model/views/widgets/carsData.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../generated/l10n.dart';
import 'CarDetailsPage.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({super.key});

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {

  List<String> filteredBrands = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredBrands = carsData.keys.toList();
  }

  void _filterBrands(String query) {
    setState(() {
      filteredBrands = carsData.keys
          .where((brand) => brand.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _openBrandDetails(String brand) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarDetailsPage(
          brand: brand,
          models: carsData[brand]!,
        ),
      ),
    );

    if (result != null) {
      Navigator.pop(context, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: SecoundColor,
      appBar: CustomAppBar(title: S.of(context).AddCar),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).addCarPageSubtitle,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              height: screenWidth * 0.12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(screenWidth * 32),
                  border: Border.all(color: const Color(0xff333333)),
                ),
                child: TextField(
                  controller: _searchController,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: S.of(context).searchCarHint,
                    hintStyle: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                    prefixIcon: SizedBox(
                      width: screenWidth * 0.12,
                      height: screenWidth * 0.12,
                      child: Center(
                        child: Image.asset(
                          'Assets/search.png',
                          color: Colors.black54,
                          width: screenWidth * 0.05,
                          height: screenWidth * 0.05,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 32),
                      borderSide: BorderSide(color: KprimaryColor, width: 2),
                    ),
                  ),
                  onChanged: _filterBrands,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Image.asset(
                  'Assets/f7_car-fill.png',
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: screenWidth * 0.03),
                Text(
                  S.of(context).MostPopular,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: filteredBrands.isEmpty
                  ? Center(
                child: Text(
                  S.of(context).searchNotFound,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
                  : ListView.builder(
                itemCount: filteredBrands.length,
                itemBuilder: (context, index) {
                  final brand = filteredBrands[index];
                  return Directionality(
                    textDirection: TextDirection.ltr,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => _openBrandDetails(brand),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.add,
                                  color: ThirdColor,
                                  size: screenWidth * 0.07),
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                brand,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade200,
                          height: screenHeight * 0.03,
                          thickness: 1,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

