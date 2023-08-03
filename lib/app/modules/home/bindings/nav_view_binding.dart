import 'package:get/get.dart';
import 'package:sleep_sounds/app/modules/home/controller/custom_sound_ctl.dart';
import 'package:sleep_sounds/app/modules/home/controller/home_view_ctl.dart';
import 'package:sleep_sounds/app/modules/home/controller/settings_ctl.dart';

import '../controller/nav_view_ctl.dart';

class NavViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavCTL());
    Get.put(HomeViewCTL());
    Get.put(CustomSoundCTL());
    Get.put(SettingsCTL());
  }
}
