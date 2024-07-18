import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_pages.dart';
import 'app_lovin_provider.dart';

class SplashController extends GetxController {
  //TODO: Implement HomeControlle
  bool? isFirstTime = true;
  final prefs = SharedPreferences.getInstance();

  var tabIndex = 0.obs;
  Rx<int> percent = 0.obs;
  Rx<bool> isLoaded = false.obs;
  @override
  void onInit() async {
    super.onInit();
    AppLovinProvider.instance.init();
    Timer? timer;
    timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      int n = Random().nextInt(10) + 5;
      percent.value += n;
      if (percent.value >= 100) {
        percent.value = 100;
        Get.offNamed(Routes.NavView);
        // isLoaded.value = true;

        timer!.cancel();
      }
    });

    // prefs.then((SharedPreferences pref) {
    //   isFirstTime = pref.getBool('first_time') ?? true;

    //   print("Is First Time from Init: $isFirstTime");
    // });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // void setFirstTime(bool bool) {
  //   prefs.then((SharedPreferences pref) {
  //     pref.setBool('first_time', bool);
  //     print("Is First Time: $isFirstTime");
  //   });
  // }
}
