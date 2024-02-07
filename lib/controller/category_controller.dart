import 'package:farms_agora/gen/assets.gen.dart';
import 'package:farms_agora/models/category.dart';
import 'package:farms_agora/models/product.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories(); // Load categories initially
  }

  void loadCategories() {
    // This method would fetch data from an API or local database and populate the categories
    // For demonstration, we'll add categories manually
    categories.addAll([
      Category(
        title: 'Grains',
        products: [
          Product(
              imageUrl: Assets.images.grain1.path,
              name: "Maize",
              farmName: 'Ushaseer Farms',
              price: 'N6,000/Pack',
              originalPrice: 'N9,000',
              location: 'Kaduna',
              isLiked: true),
          Product(
              imageUrl: Assets.images.grain2.path,
              name: "Chick Pea",
              farmName: 'Ushaseer Farms',
              price: 'N6,000/Pack',
              originalPrice: 'N9,000',
              location: 'Kaduna',
              isLiked: false),
          Product(
              imageUrl: Assets.images.grain1.path,
              name: "Maize",
              farmName: 'Ushaseer Farms',
              price: 'N6,000/Pack',
              originalPrice: 'N9,000',
              location: 'Kaduna',
              isLiked: false)
        ],
      ),
      Category(
        title: 'Legumes',
        products: [
          Product(
              imageUrl: Assets.images.legumes1.path,
              name: "Cow Pea",
              farmName: 'Ushaseer Farms',
              price: 'N6,000/Pack',
              originalPrice: 'N9,000',
              location: 'Kaduna',
              isLiked: false),
          Product(
              imageUrl: Assets.images.legumes2.path,
              name: "Brown Beans",
              farmName: 'Ushaseer Farms',
              price: 'N6,000/Pack',
              originalPrice: 'N9,000',
              location: 'Kaduna',
              isLiked: false),
          Product(
              imageUrl: Assets.images.legumes1.path,
              name: "Cow Pea",
              farmName: 'Ushaseer Farms',
              price: 'N6,000/Pack',
              originalPrice: 'N9,000',
              location: 'Kaduna',
              isLiked: false)
        ],
      ),
      Category(
        title: 'Tubers',
        products: [
          Product(
              imageUrl: Assets.images.tubers1.path,
              name: "Irish Potatoes",
              farmName: 'Ushaseer Farms',
              price: 'N6,000/Pack',
              originalPrice: 'N9,000',
              location: 'Kaduna',
              isLiked: false),
          Product(
              imageUrl: Assets.images.tubers2.path,
              name: "Yams",
              farmName: 'Ushaseer Farms',
              price: 'N6,000/Pack',
              originalPrice: 'N9,000',
              location: 'Kaduna',
              isLiked: false),
          Product(
              imageUrl: Assets.images.tubers1.path,
              name: "Irish Potatoes",
              farmName: 'Ushaseer Farms',
              price: 'N6,000/Pack',
              originalPrice: 'N9,000',
              location: 'Kaduna',
              isLiked: false)
        ],
      ),
      Category(
        title: 'Nuts/Seeds',
        products: [
          Product(
              imageUrl: Assets.images.nutsSeeds1.path,
              name: "Groundnuts",
              farmName: 'Ushaseer Farms',
              price: 'N6,000/Pack',
              originalPrice: 'N9,000',
              location: 'Kaduna',
              isLiked: false),
          Product(
              imageUrl: Assets.images.nutsSeeds2.path,
              name: "Kola-nuts",
              farmName: 'Ushaseer Farms',
              price: 'N6,000/Pack',
              originalPrice: 'N9,000',
              location: 'Kaduna',
              isLiked: false),
          Product(
              imageUrl: Assets.images.nutsSeeds1.path,
              name: "Groundnuts",
              farmName: 'Ushaseer Farms',
              price: 'N6,000/Pack',
              originalPrice: 'N9,000',
              location: 'Kaduna',
              isLiked: false)
        ],
      ),
    ]);
  }

  Category getCategoryFromLabel(String label) {
    // Find the first category with a matching title
    return categories.firstWhere(
        (category) => category.title.toLowerCase() == label.toLowerCase(),
        orElse: () {
      // If no matching category is found, return a default category or handle it as needed
      return Category(title: 'Default Category', products: []);
    });
  }
}
