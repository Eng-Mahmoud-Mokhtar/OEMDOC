import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import 'package:oemdoc/Feature/Home/presentation/view_model/views/widgets/ConvexNotchedShape.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Profile/presentation/view_model/views/Profile.dart';
import '../../../../Search/presentation/view_model/views/SearchPage.dart';
import '../../../../cart/presentation/view_model/views/Cart.dart';
import 'Home.dart';
import 'SubPages.dart';

class HomeStructure extends StatefulWidget {
  const HomeStructure({super.key});

  @override
  _HomeStructureState createState() => _HomeStructureState();
}

class _HomeStructureState extends State<HomeStructure> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      const HomePage(),
      const SearchPage(),
      const ActionPage(),
      Cart(onNavigateToSearch: () {
        setState(() {
          _selectedIndex = 1;
        });
      }),
      const ProfilePage(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        child: Container(
          width: screenWidth * 0.13,
          height: screenWidth * 0.13,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ThirdColor,
            boxShadow: [
              BoxShadow(
                color: ThirdColor.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 12,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              "Assets/mingcute_ai-line.png",
              width: screenWidth * 0.07,
              height: screenWidth * 0.07,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.zero,
        child: SizedBox(
          height: screenWidth * 0.175,
          child: BottomAppBar(
            color: Colors.white,
            shape: const ConvexNotchedShape(),
            notchMargin: 1.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem(
                  image: "Assets/home-2.png",
                  selectedImage: "Assets/home2.png",
                  label: S.of(context).Home,
                  index: 0,
                  screenWidth: screenWidth,
                ),
                _buildNavItem(
                  image: "Assets/search.png",
                  selectedImage: "Assets/search-normal.png",
                  label: S.of(context).Search,
                  index: 1,
                  screenWidth: screenWidth,
                ),
                SizedBox(width: screenWidth * 0.12),
                _buildNavItem(
                  image: "Assets/bag.png",
                  selectedImage: "Assets/cart2.png",
                  label: S.of(context).Cart,
                  index: 3,
                  screenWidth: screenWidth,
                ),
                _buildNavItem(
                  image: "Assets/user.png",
                  selectedImage: "Assets/user2.png",
                  label: S.of(context).profile,
                  index: 4,
                  screenWidth: screenWidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String image,
    required String selectedImage,
    required String label,
    required int index,
    required double screenWidth,
  }) {
    final bool isSelected = _selectedIndex == index;

    return InkResponse(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      radius: screenWidth * 0.1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isSelected ? selectedImage : image,
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 2),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isSelected ? 1.0 : 0.0,
            child: Text(
              label,
              style: TextStyle(
                color: ThirdColor,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.025,
              ),
            ),
          ),
        ],
      ),
    );
  }
}