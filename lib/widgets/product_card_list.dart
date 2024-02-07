import 'package:farms_agora/models/product.dart';
import 'package:farms_agora/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  final String title;

  const ProductList({
    Key? key,
    required this.products,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
              ),
            ),
            const Spacer(),
            const Text(
              "See all",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                fontFamily: "Mulish",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                productName: product.name,
                farmName: product.farmName,
                location: product.location,
                price: product.price,
                originalPrice: product.originalPrice,
                imageUrl: product.imageUrl,
                isLiked: product.isLiked,
              );
            },
          ),
        ),
      ],
    );
  }
}
