import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

class SettingsCTL extends GetxController {
  InAppReview inAppReview = InAppReview.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  ShareApp() {
    Share.share(
        "Consider downloading this exceptional app, available on the Google Play Store at the following link: https://play.google.com/store/apps/details?id=com.relaxingsounds.relaxingmusicsleepsounds.");
  }

  void rateApp() async {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    } else {
      Get.snackbar(
        "Unavailable",
        "In-app review is not available on this device.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
