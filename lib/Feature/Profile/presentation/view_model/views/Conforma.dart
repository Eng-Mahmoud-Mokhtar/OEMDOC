import 'dart:io';
import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import '../../../../../generated/l10n.dart';
import 'CreatePostPage.dart';

class Conforma extends StatefulWidget {
  const Conforma({super.key});

  @override
  State<Conforma> createState() => _ConformaState();
}

class _ConformaState extends State<Conforma> {
  bool isSearching = false;

  List<Map<String, dynamic>> posts = [
    {
      "name": "Mahmoud Mokhtar",
      "time": "منذ ساعة",
      "content":
          "لقد كنت أتابع كمية المياه التي أشربها مع أوسلر طوال الأسبوع الماضي، وأشعر بتحسن كبير! 💧 #تحدي_الترطيب #اشرب_المزيد_من_الماء",
      "image": "Assets/Frame.png",
      "likes": "250",
      "comments": "60",
      "views": "3.1k",
      "isAsset": true,
    },
    {
      "name": "Sara Ahmed",
      "time": "منذ 3 ساعات",
      "content": "الحمد لله أنهيت تمريني اليوم بنجاح 💪🔥 #رياضة #صحة",
      "image": null,
      "likes": "180",
      "comments": "25",
      "views": "1.8k",
      "isAsset": true,
    },
    {
      "name": "Ahmed Mokhtar",
      "time": "منذ ساعة",
      "content":
      "لقد كنت أتابع كمية المياه التي أشربها مع أوسلر طوال الأسبوع الماضي، وأشعر بتحسن كبير! 💧 #تحدي_الترطيب #اشرب_المزيد_من_الماء",
      "image": "Assets/Frame.png",
      "likes": "250",
      "comments": "60",
      "views": "3.1k",
      "isAsset": true,
    },
  ];

  final hashtags = [
    "#سيارات",
    "#قطع_غيار",
    "#صيانة",
    "#تعديل_سيارات",
    "#سباقات",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).community,
          style: TextStyle(
            fontSize: size.width * 0.035,
            fontWeight: FontWeight.bold,
            color: KprimaryText,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final newPost = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreatePostPage()),
              );

              if (newPost != null) {
                setState(() {
                  posts.insert(0, newPost);
                });
              }
            },
            icon: Icon(
              Icons.add,
              color: KprimaryColor,
              size: size.width * 0.06,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(
          bottom: size.height * 0.02,
        ),
        children: [
          // 🔍 السيرش
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.02,
            ),
            child: SizedBox(
              height: size.width * 0.12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(size.width * 32),
                  border: Border.all(color: const Color(0xff333333)),
                ),
                child: TextField(
                  onTap: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    fontSize: size.width * 0.03,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: S.of(context).searchHint,
                    hintStyle: TextStyle(
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                    prefixIcon: SizedBox(
                      width: size.width * 0.12,
                      height: size.width * 0.12,
                      child: Center(
                        child: Image.asset(
                          'Assets/search.png',
                          color: Colors.black54,
                          fit: BoxFit.contain,
                          width: size.width * 0.05,
                          height: size.width * 0.05,
                        ),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ),

          // 🟢 المحتوى (رائج أو بوستات)
          if (isSearching)
            buildTrending(size)   // 🔥 الرائج يبدأ من بعد السيرش مباشرة
          else
            ...posts.map((post) => buildPostCard(post, size)).toList(),
        ],
      ),
    );
  }

  Widget buildTrending(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).trendingTopics,
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.015),
          Wrap(
            spacing: size.width * 0.02,
            runSpacing: size.height * 0.01,
            alignment: WrapAlignment.start,
            children: hashtags.map(
                  (tag) => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                  vertical: size.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }

// 🟢 كارت البوست
  Widget buildPostCard(Map<String, dynamic> post, Size size) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.01,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.width * 0.04),
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الهيدر
            Row(
              children: [
                CircleAvatar(
                  radius: size.width * 0.06,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.person, color: ThirdColor, size: size.width * 0.05),
                ),
                SizedBox(width: size.width * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post["name"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.035,
                        color: KprimaryText,
                      ),
                    ),
                    Text(
                      post["time"],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.width * 0.03,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: size.height * 0.02),
            if (post["content"] != null && post["content"].toString().isNotEmpty)
              Text(
                post["content"],
                style: TextStyle(
                  fontSize: size.width * 0.03,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                ),
              ),
            if (post["image"] != null) ...[
              SizedBox(height: size.height * 0.02),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: post["isAsset"] == true
                    ? Image.asset(
                  post["image"],
                  width: double.infinity,
                  height: size.height * 0.25,
                  fit: BoxFit.cover,
                )
                    : Image.file(
                  File(post["image"]),
                  width: double.infinity,
                  height: size.height * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                Icon(Icons.favorite_border, size: size.width * 0.05, color: Colors.grey),
                SizedBox(width: size.width * 0.01),
                Text(post["likes"] ?? "0", style: TextStyle(fontSize: size.width * 0.03, color: KprimaryText)),
                SizedBox(width: size.width * 0.04),
                Icon(Icons.comment_outlined, size: size.width * 0.05, color: Colors.grey),
                SizedBox(width: size.width * 0.01),
                Text(post["comments"] ?? "0", style: TextStyle(fontSize: size.width * 0.03, color: KprimaryText)),
                SizedBox(width: size.width * 0.04),
                Icon(Icons.remove_red_eye_outlined, size: size.width * 0.05, color: Colors.grey),
                SizedBox(width: size.width * 0.01),
                Text(post["views"] ?? "0", style: TextStyle(fontSize: size.width * 0.03, color: KprimaryText)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPostsList(Size size) {
    return ListView.builder(
      padding: EdgeInsets.all(size.width * 0.04),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          color: Colors.white,
          margin: EdgeInsets.only(bottom: size.height * 0.02),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width * 0.04),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🟢 الهيدر
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                      ),
                      child: CircleAvatar(
                        radius: size.width * 0.06, // ✅ حجم الأفاتار
                        backgroundColor: Colors.grey.shade300,
                        child: Icon(
                          Icons.person,
                          color: ThirdColor,
                          size: size.width * 0.05, // ✅ أيقونة جوه الأفاتار
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          post["name"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.035,
                            color: KprimaryText
                          ),
                        ),
                        Text(
                          post["time"],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: size.width * 0.03,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.02),
                if (post["content"] != null && post["content"].toString().isNotEmpty)
                  Text(
                    post["content"],
                    style: TextStyle(
                      fontSize: size.width * 0.03,
                      height: 1.4,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                if (post["image"] != null) ...[
                  SizedBox(height: size.height * 0.02),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: post["isAsset"] == true
                        ? Image.asset(
                      post["image"],
                      width: double.infinity,
                      height: size.height * 0.25,
                      fit: BoxFit.cover,
                    )
                        : Image.file(
                      File(post["image"]),
                      width: double.infinity,
                      height: size.height * 0.1, // ✅ طول ثابت للصورة
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
                SizedBox(height: size.height * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: size.width * 0.05,
                      color: Colors.grey,
                    ),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      post["likes"] ?? "0",
                      style: TextStyle(fontSize: size.width * 0.03,color: KprimaryText), // ✅ حجم النص
                    ),
                    SizedBox(width: size.width * 0.04),
                    Icon(
                      Icons.comment_outlined,
                      size: size.width * 0.05,
                      color: Colors.grey,
                    ),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      post["comments"] ?? "0",
                      style: TextStyle(fontSize: size.width * 0.03,color: KprimaryText),
                    ),
                    SizedBox(width: size.width * 0.04),
                    Icon(
                      Icons.remove_red_eye_outlined,
                      size: size.width * 0.05,
                      color: Colors.grey,
                    ),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      post["views"] ?? "0",
                      style: TextStyle(fontSize: size.width * 0.03,color: KprimaryText),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

