import 'package:flutter/material.dart';
import 'package:oemdoc/Core/Widgets/AppBar.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../Product/presentation/view_model/views/SuggerstedForYou.dart';

class NotificationItem {
  final String imageUrl;
  final String title;
  final String content;

  NotificationItem({
    required this.imageUrl,
    required this.title,
    required this.content,
  });
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late List<NotificationItem> notifications;

  @override
  void initState() {
    super.initState();
    // ⚡ قم بتهيئة القائمة هنا
    notifications = [
      NotificationItem(
        imageUrl: 'Assets/Screenshot (72).png',
        title: S.current.newNotification,
        content: 'تم إضافة عرض جديد على منتجاتك المفضلة!',
      ),
      NotificationItem(
        imageUrl: 'Assets/Screenshot (72).png',
        title: S.current.newNotification,
        content: 'تم تحديث الأسعار لهذا الأسبوع.',
      ),
      NotificationItem(
        imageUrl: 'Assets/Screenshot (72).png',
        title: S.current.newNotification,
        content: 'لديك منتجات في السلة لم تكمل الشراء بعد.',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: SecoundColor,
      appBar: CustomAppBar(title: S.of(context).notificationsTitle),
      body: notifications.isEmpty
          ? Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.5,
                height: screenWidth * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/empty 1.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                S.of(context).noNotifications,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: KprimaryText,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                S.of(context).exclusiveOffer,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Products(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KprimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: SizedBox(
                    height: screenWidth * 0.12,
                    child: Center(
                      child: Text(
                        S.of(context).browseProducts,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                          color: SecoundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
            ],
          ),
        ),
      )
          : ListView.separated(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
          child: Divider(
            color: Colors.grey[400],
            thickness: 1.5,
          ),
        ),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                item.imageUrl,
                width: screenWidth * 0.12,
                height: screenWidth * 0.12,
                fit: BoxFit.cover,
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.035,
                        color: KprimaryText,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      item.content,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: SecoundText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton<int>(
                color: Colors.white,
                icon: Icon(
                  Icons.more_vert,
                  size: screenWidth * 0.05,
                  color: Colors.grey[700],
                ),
                onSelected: (value) {
                  if (value == 1) {
                    setState(() {
                      notifications.removeAt(index);
                    });
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      S.of(context).delete,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: KprimaryText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
