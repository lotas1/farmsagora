import 'package:farms_agora/controller/category_controller.dart';
import 'package:farms_agora/gen/assets.gen.dart';
import 'package:farms_agora/models/category.dart';
import 'package:farms_agora/models/chip.dart';
import 'package:farms_agora/pages/market/all_category.dart';
import 'package:farms_agora/pages/market/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MarketController extends GetxController {
  final selectedChipIndex = 0.obs;
  final selectedChipCategory = "ALL".obs;
}

final List<ChipData> chipData = [
  ChipData('ALL', Assets.icons.all.path),
  ChipData('GRAINS', Assets.icons.crops.path),
  ChipData('LEGUMES', Assets.icons.discounts.path),
  ChipData('TUBERS', Assets.icons.crops.path),
  ChipData('NUTS/SEEDS', Assets.icons.discounts.path),
];

class MarketPage extends StatelessWidget {
  MarketPage({super.key});

  final MarketController marketController = Get.put(MarketController());
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          _buildChipList(marketController),
          const SizedBox(
            height: 10,
          ),
          Obx(() => _categoryPage(marketController))
        ],
      ),
    );
  }

  Widget _categoryPage(MarketController marketController) {
    String categoryLabel = marketController.selectedChipCategory.value;

    if (categoryLabel == "ALL") {
      return Flexible(child: AllProductListPage());
    } else {
      Category category =
          categoryController.getCategoryFromLabel(categoryLabel);

      return Flexible(
          child: CategoryProductListPage(
        title: category.title,
        products: category.products,
      ));
    }
  }

  // New method to build the chip list
  Widget _buildChipList(MarketController marketController) {
    return Obx(() => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(chipData.length, (index) {
              final chip = chipData[index];
              final bool isSelected =
                  marketController.selectedChipIndex.value == index;

              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    marketController.selectedChipIndex.value = index;
                    marketController.selectedChipCategory.value =
                        chipData[index].label;
                  },
                  child: SizedBox(
                    height: 34.0,
                    child: Chip(
                      avatar: SvgPicture.asset(
                        chip.iconPath,
                        color: isSelected ? Colors.white : Colors.black,
                        width: 24,
                        height: 24,
                      ),
                      label: Text(
                        chip.label,
                        style: TextStyle(
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      backgroundColor:
                          isSelected ? Colors.orange : Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
