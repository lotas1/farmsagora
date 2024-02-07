import 'package:farms_agora/controller/category_controller.dart';
import 'package:farms_agora/widgets/product_card_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductListPage extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  AllProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      itemCount: categoryController.categories.length,
      itemBuilder: (context, index) {
        var category = categoryController.categories[index];
        return Column(
          children: [
            SizedBox(
              height: 270,
              child: ProductList(
                title: category.title,
                products: category.products,
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    ));
  }
}











/*
* class VerticalProductListPage extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  VerticalProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      itemCount: categoryController.categories.length,
      itemBuilder: (context, index) {
        var category = categoryController.categories[index];
        return Column(
          children: [
            ProductList(
              title: category.title,
              products: category.products,
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    ));
  }
}*/