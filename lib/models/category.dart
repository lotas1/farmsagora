import 'package:farms_agora/models/product.dart';

class Category {
  final String title;
  final List<Product> products;

  Category({
    required this.title,
    required this.products,
  });
}