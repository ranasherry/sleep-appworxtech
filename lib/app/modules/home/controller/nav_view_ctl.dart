import 'package:get/get.dart';
import 'package:sleep_sounds/app/modules/home/views/custom_sound_view.dart';

import '../views/home_view.dart';
import '../views/settings_view.dart';

class NavCTL extends GetxController {
  RxInt current_index = 0.obs;

  int navAdCounter = 1;
  final screens = [
    HomeView(),
    CustomSoundView(),
    SettingsView(),
  ];
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
