import 'package:flutter/material.dart';
import '../../../../../Core/Widgets/Button.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../../../../../generated/l10n.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).add_new_post,
          style: TextStyle(
            fontSize: size.width * 0.035,
            fontWeight: FontWeight.bold,
            color: KprimaryText,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(
          size.width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.02,
                  ),
                  child: CircleAvatar(
                    radius: size.width * 0.05,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(
                      Icons.person,
                      color: ThirdColor,
                      size: size.width * 0.05,
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: null,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      hintText: S.of(context).whatOnYourMind,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: size.height * 0.06),

            Row(
              children: [
                buildCircleIcon("Assets/Monotone add.png", size),
                SizedBox(width: size.width * 0.02),
                buildCircleIcon("Assets/Monotone add (1).png", size),
              ],
            ),

            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: buildHashtagBox("#صحة", size)),
                SizedBox(width: size.width * 0.02),
                Expanded(child: buildHashtagBox("#رياضة", size)),
                SizedBox(width: size.width * 0.03),
                Text(
                  S.of(context).addHashtag,
                  style: TextStyle(
                    fontSize: size.width * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.width * 0.04),
            Button(text: S.of(context).publish, onPressed: () {  },)
          ],
        ),
      ),
    );
  }

  Widget buildCircleIcon(String assetPath, Size size) {
    return Container(
      width: size.width * 0.1,
      height: size.width * 0.1,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xffD1D5DB), width: 1),
      ),
      child: Container(
        margin: EdgeInsets.all(size.width * 0.01),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(
          child: Image.asset(
            assetPath,
            width: size.width * 0.05,
            height: size.width * 0.05,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget buildHashtagBox(String text, Size size) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.height * 0.01,
      ),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      decoration: BoxDecoration(
        border: Border.all(color: KprimaryColor),
        borderRadius: BorderRadius.circular(size.width * 0.03),
      ),
      child: Text(
        text,
        style: TextStyle(color: KprimaryColor, fontSize: size.width * 0.035,fontWeight: FontWeight.w500),
      ),
    );
  }
}