import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utills/size_config.dart';
import '../controller/nav_view_ctl.dart';

class NavView extends GetView<NavCTL> {
  const NavView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Obx(() =>
          Container(child: controller.screens[controller.current_index.value])),
      bottomNavigationBar: Obx(() => BottomNavyBar(
            containerHeight: SizeConfig.blockSizeHorizontal * 18,
            backgroundColor: Colors.black,
            itemCornerRadius: 15,
            onItemSelected: (index) => controller.current_index.value = index,
            selectedIndex: controller.current_index.value,
            items: [
              BottomNavyBarItem(
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey.shade600,
                  icon: Icon(
                    CupertinoIcons.music_note_2,
                  ),
                  title: Text(
                    "Sounds",
                    textAlign: TextAlign.center,
                  )),
              BottomNavyBarItem(
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey.shade500,
                  icon: Icon(Icons.graphic_eq_rounded),
                  title: Text(
                    "Custom",
                    textAlign: TextAlign.center,
                  )),
              BottomNavyBarItem(
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey.shade500,
                  icon: Icon(Icons.settings_suggest_outlined),
                  title: Text(
                    "Settings",
                    textAlign: TextAlign.center,
                  )),
            ],
          )),
    );
  }
}
