import 'package:farms_agora/controller/category_controller.dart';
import 'package:farms_agora/pages/market/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var category = categoryController.categories[0];
    // TODO: implement build
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8));
  }
}
