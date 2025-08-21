import 'package:flutter/material.dart';
import 'package:oemdoc/Feature/MyShipment/presentation/view_model/views/widgets/ShipmentTab.dart';
import 'package:oemdoc/Feature/MyShipment/presentation/view_model/views/widgets/ShipmentTabBar.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/utiles/Colors.dart';
import '../../../../../../generated/l10n.dart';
import '../ShipmentCardData.dart';

class MyShipmentsPage extends StatefulWidget {
  const MyShipmentsPage({super.key});

  @override
  State<MyShipmentsPage> createState() => _MyShipmentsPageState();
}

class _MyShipmentsPageState extends State<MyShipmentsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List<Widget> pages = [
      ShipmentTab(
        shipments: [
          ShipmentCardData(
            shipmentNumber: "${S.of(context).shipment} 255",
            productImage: "Assets/image 5.png",
            productName: "زيت ليكو مولي",
            quantity: 2,
            variant: "هيونداي سوناتا",
            price: "38 ${S.of(context).SYP}",
            totalPrice: "76 ${S.of(context).SYP}",
            statusText:
            "${S.of(context).expectedDelivery} 15 ${S.of(context).day}",
            statusColor: ThirdColor,
            statusIcon: "Assets/loading.png",
          ),
          ShipmentCardData(
            shipmentNumber: "${S.of(context).shipment} 256",
            productImage: "Assets/image 5.png",
            productName: "زيت محرك شيل",
            quantity: 1,
            variant: "تويوتا كورولا",
            price: "45 ${S.of(context).SYP}",
            totalPrice: "45 ${S.of(context).SYP}",
            statusText: S.of(context).preparingForShipping,
            statusColor: ThirdColor,
            statusIcon: "Assets/loading.png",
          ),
        ],
      ),
      ShipmentTab(
        shipments: [
          ShipmentCardData(
            shipmentNumber: "شحنة 257",
            productImage: "Assets/image 5.png",
            productName: "زيت محرك موبيل",
            quantity: 1,
            variant: "هيونداي أكسنت",
            price: "60 ${S.of(context).SYP}",
            totalPrice: "60 ${S.of(context).SYP}",
            statusText: "${S.of(context).deliveredAt} 1.05.2024, 15:42",
            statusColor: Colors.black54,
            statusIcon: "Assets/done.png",
          ),
          ShipmentCardData(
            shipmentNumber: "شحنة 258",
            productImage: "Assets/image 5.png",
            productName: "فلتر زيت",
            quantity: 1,
            variant: "كيا سيراتو",
            price: "25 ${S.of(context).SYP}",
            totalPrice: "25 ${S.of(context).SYP}",
            statusText: "${S.of(context).deliveredAt} 10.05.2024, 18:20",
            statusColor: Colors.black54,
            statusIcon: "Assets/done.png",
          ),
        ],
      ),
      ShipmentTab(
        shipments: [
          ShipmentCardData(
            shipmentNumber: "شحنة 259",
            productImage: "Assets/image 5.png",
            productName: "زيت محرك توتال",
            quantity: 1,
            variant: "نيسان صني",
            price: "50 ${S.of(context).SYP}",
            totalPrice: "50 ${S.of(context).SYP}",
            statusText: S.of(context).deliveryFailed,
            statusColor: Colors.black54,
            statusIcon: "",
            isCancelled: true,
          ),
          ShipmentCardData(
            shipmentNumber: "شحنة 260",
            productImage: "Assets/image 5.png",
            productName: "زيت محرك كاسترول",
            quantity: 1,
            variant: "هوندا سيفيك",
            price: "55 ${S.of(context).SYP}",
            totalPrice: "55 ${S.of(context).SYP}",
            statusText: S.of(context).deliveryFailed,
            statusColor: Colors.black54,
            statusIcon: "",
            isCancelled: true,
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: S.of(context).MyShipments,
      ),
      body: Column(
        children: [
          ShipmentTabBar(
            selectedIndex: selectedIndex,
            onTap: (i) => setState(() => selectedIndex = i),
          ),
          SizedBox(height: screenWidth * 0.04),
          Expanded(child: pages[selectedIndex]),
        ],
      ),
    );
  }
}

