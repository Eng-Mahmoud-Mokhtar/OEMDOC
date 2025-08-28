import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../../../../../Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../Home/presentation/view_model/views/widgets/SectionCategories.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? selectedBrand;
  String? selectedModel;
  String? selectedEngine;
  bool showFilters = false;
  List<String> previousSearches = [];
  final TextEditingController _searchController = TextEditingController();

  final List<String> brands = [
    "تويوتا اليابانية العالمية لصناعة السيارات",
    "هيونداي",
    "كيا موتورز المحدودة"
  ];
  final List<String> models = [
    "كورولا إصدار خاص طويل الاسم جدًا للتجربة",
    "إلنترا",
    "سبورتاج"
  ];
  final List<String> engines = [
    "1600 CC محرك بنزين طويل الاسم للتجربة",
    "2000 CC",
    "2500 CC"
  ];

  void removeSearch(int index) {
    setState(() {
      previousSearches.removeAt(index);
    });
  }

  void addSearch(String search) {
    if (search.isNotEmpty) {
      setState(() {
        previousSearches.insert(0, search);
        if (previousSearches.length > 10) previousSearches.removeLast();
        _searchController.clear();
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: const Color(0xFFFFF8F4),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.04),
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
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: S.of(context).searchByPart,
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
                                fit: BoxFit.contain,
                                width: screenWidth * 0.05,
                                height: screenWidth * 0.05,
                              ),
                            ),
                          ),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 32),
                            borderSide: const BorderSide(color: KprimaryColor, width: 2),
                          ),
                          contentPadding: EdgeInsets.zero,
                        ),
                        onTap: () {
                          setState(() {
                            showFilters = true;
                          });
                        },
                        onSubmitted: (value) => addSearch(value),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  if (showFilters)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: _buildDropdown(
                            screenWidth,
                            S.of(context).brand,
                            selectedBrand,
                            brands,
                                (val) => setState(() => selectedBrand = val),
                            "Assets/cbi_model-s-side.png",
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Flexible(
                          child: _buildDropdown(
                            screenWidth,
                            S.of(context).model,
                            selectedModel,
                            models,
                                (val) => setState(() => selectedModel = val),
                            "Assets/ic_sharp-model-training.png",
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Flexible(
                          child: _buildDropdown(
                            screenWidth,
                            S.of(context).engine,
                            selectedEngine,
                            engines,
                                (val) => setState(() => selectedEngine = val),
                            "Assets/mingcute_engine-line.png",
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Image.asset(
                          "Assets/mage_filter-fill.png",
                          fit: BoxFit.contain,
                          color: const Color(0xff4D4D4D),
                          width: screenWidth * 0.06,
                          height: screenWidth * 0.06,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showFilters)
                    Text(
                      S.of(context).PreviousSearches,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                        color: KprimaryText,
                      ),
                    ),
                  SizedBox(height: showFilters ? screenHeight * 0.02 : 0),
                  if (showFilters)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(previousSearches.take(4).length, (i) {
                          String search = previousSearches[i];
                          return Row(
                            children: [
                              IntrinsicWidth(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03, vertical: screenHeight * 0.01),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffE6E6E6),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        search,
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.03,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(width: screenWidth * 0.02),
                                      GestureDetector(
                                        onTap: () => removeSearch(i),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.black,
                                          size: screenWidth * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (i != previousSearches.take(4).length - 1)
                                SizedBox(width: screenWidth * 0.02),
                            ],
                          );
                        }),
                      ),
                    )
                  else
                    Categories(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(
      double screenWidth,
      String hint,
      String? value,
      List<String> items,
      Function(String?) onChanged,
      String iconPath,
      ) {
    return Container(
      height: screenWidth * 0.12,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      decoration: BoxDecoration(
        color: const Color(0xffFAFAFA),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xff333333)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value: value,
          isExpanded: true,
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: screenWidth * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            offset: const Offset(0, 0),
          ),
          selectedItemBuilder: (context) {
            return items.map((e) {
              return Row(
                children: [
                  Image.asset(
                    iconPath,
                    fit: BoxFit.contain,
                    width: screenWidth * 0.05,
                    height: screenWidth * 0.05,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Expanded(
                    child: Text(
                      e,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              );
            }).toList();
          },
          hint: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                fit: BoxFit.contain,
                width: screenWidth * 0.05,
                height: screenWidth * 0.05,
              ),
              SizedBox(width: screenWidth * 0.01),
              Expanded(
                child: Text(
                  hint,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ),
          items: items
              .map((e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: Colors.black,
              ),
            ),
          ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
