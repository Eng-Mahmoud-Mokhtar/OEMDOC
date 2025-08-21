import 'package:flutter/cupertino.dart';
import '../../ShipmentCardData.dart';
import 'ShipmentCard.dart';

class ShipmentTab extends StatelessWidget {
  final List<ShipmentCardData> shipments;

  const ShipmentTab({super.key, required this.shipments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shipments.length,
      itemBuilder: (context, index) {
        return ShipmentCard(data: shipments[index]);
      },
    );
  }
}