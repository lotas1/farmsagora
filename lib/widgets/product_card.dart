import 'package:farms_agora/gen/assets.gen.dart';
import 'package:farms_agora/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String farmName;
  final String location;
  final String price;
  final String originalPrice;
  final String imageUrl;
  final bool isLiked;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.farmName,
    required this.location,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.isLiked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 174,
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            height: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imageUrl,
                        width: double.infinity,
                        height: 136.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                      icon: isLiked
                          ? Assets.icons.like.svg()
                          : Assets.icons.unlike.svg(),
                      onPressed: () {
                        // Implement your like/unlike functionality here
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        productName,
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    IconButton(
                      icon: Assets.icons.cart.svg(width: 15, height: 15),
                      iconSize: 15,
                      onPressed: () {},
                    ),
                  ],
                ),
                // const SizedBox(height: 4.0),
                Row(
                  children: [
                    Image.asset(
                      Assets.images.ellipse.path,
                      width: 15,
                      height: 15,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      '$farmName ',
                      style: const TextStyle(
                          fontSize: 9.0,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w300),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Assets.icons.location.svg(width: 7, height: 9),
                    ),
                    Text(
                      '$location ',
                      style: const TextStyle(
                          fontSize: 9.0,
                          fontFamily: FontFamily.mulish,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                          fontSize: 9.0,
                          fontFamily: FontFamily.monumentExtended,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      originalPrice,
                      style: const TextStyle(
                          fontSize: 8.0,
                          fontFamily: FontFamily.mulish,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
