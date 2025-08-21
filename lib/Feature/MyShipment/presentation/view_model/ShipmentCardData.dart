import 'dart:ui';

class ShipmentCardData {
  final String shipmentNumber;
  final String productImage;
  final String productName;
  final int quantity;
  final String variant;
  final String price;
  final String totalPrice;
  final String statusText;
  final Color statusColor;
  final String statusIcon;
  final bool isCancelled;

  ShipmentCardData({
    required this.shipmentNumber,
    required this.productImage,
    required this.productName,
    required this.quantity,
    required this.variant,
    required this.price,
    required this.totalPrice,
    required this.statusText,
    required this.statusColor,
    required this.statusIcon,
    this.isCancelled = false,
  });
}