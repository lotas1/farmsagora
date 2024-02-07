import 'package:farms_agora/gen/assets.gen.dart';
import 'package:farms_agora/models/product.dart';
import 'package:farms_agora/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CategoryProductListPage extends StatelessWidget {
  final List<Product> products;
  final String title;

  const CategoryProductListPage({
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
             IconButton(
              icon: Assets.icons.filter.svg(),
              onPressed: () {
                // Logic for filter action
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: products.length,
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
