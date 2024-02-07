import 'package:farms_agora/gen/assets.gen.dart';
import 'package:farms_agora/pages/home.dart';
import 'package:farms_agora/pages/market/markets.dart';
import 'package:farms_agora/pages/profile.dart';
import 'package:farms_agora/pages/sell.dart';
import 'package:farms_agora/pages/stores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final currentIndex = 0.obs;

  final screens = [
    HomePage(),
    MarketPage(),
    const SellPage(),
    const StorePage(),
    const ProfilePage()
  ];
}

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _appBar(),
      body: Obx(() => navigationController
          .screens[navigationController.currentIndex.value]),
      bottomNavigationBar: Obx(() => _buildBottomNavigationBar(
          navigationController.currentIndex.value,
          (index) => navigationController.currentIndex.value = index)),
    );
  }

  AppBar _appBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: Assets.icons.harmburger.svg(),
        onPressed: () {
          // Logic to open navigation drawer or menu
        },
      ),
      actions: [
        IconButton(
          icon: Assets.icons.search.svg(),
          onPressed: () {
            // Logic for search action
          },
        ),
        IconButton(
          icon: Assets.icons.filter.svg(),
          onPressed: () {
            // Logic for filter action
          },
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0, // Removes the shadow from the AppBar
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(
      int currentIndex, Function(int) onTap) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: Colors.orange,
      elevation: 0,
      onTap: onTap,
      items: <BottomNavigationBarItem>[
        for (var item in _navBarItems(currentIndex)) item,
      ],
    );
  }

  List<BottomNavigationBarItem> _navBarItems(int currentIndex) {
    final icons = [
      Assets.icons.home,
      Assets.icons.markets,
      Assets.icons.sell,
      Assets.icons.stores,
      Assets.icons.profile,
    ];
    final labels = ['Home', 'Markets', 'Sell', 'Stores', 'Profile'];
    List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < icons.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: _buildIconWithIndicator(
              icons[i]
                  .svg(color: i == currentIndex ? Colors.orange : Colors.grey),
              i == currentIndex),
          label: labels[i],
        ),
      );
    }
    return items;
  }

  Widget _buildIconWithIndicator(Widget icon, bool isActive) {
    return Container(
      padding: EdgeInsets.only(top: isActive ? 6 : 0),
      decoration: isActive
          ? const BoxDecoration(
              border: Border(top: BorderSide(width: 3.0, color: Colors.orange)),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
            )
          : null,
      child: icon,
    );
  }
}
