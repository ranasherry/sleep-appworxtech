import 'package:get/get.dart';

import '../controller/splash_screen_ctl.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
