class Product {
  final String imageUrl;
  final String name;
  final String farmName;
  final String price;
  final String originalPrice;
  final String location;
  bool isLiked;

  Product({
    required this.imageUrl,
    required this.name,
    required this.farmName,
    required this.price,
    required this.originalPrice,
    required this.location,
    required this.isLiked,
  });
}
