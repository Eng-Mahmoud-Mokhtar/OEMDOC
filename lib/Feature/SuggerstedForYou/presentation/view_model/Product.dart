class Product {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final String oldPrice;
  final String discount;
  final String category;
  final String sellerName;
  final double rating;
  final int ratersCount;
  final List<String> comments;
  final double sellerRating;
  final int sellerPositivePercentage;
  final int sellerPartnerYears;

  Product({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.category,
    required this.sellerName,
    required this.rating,
    required this.ratersCount,
    required this.comments,
    this.sellerRating = 4.5,
    this.sellerPositivePercentage = 90,
    this.sellerPartnerYears = 4,
  });
}
