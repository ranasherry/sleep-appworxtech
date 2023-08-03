import 'package:get/get.dart';
import 'package:sleep_sounds/app/modules/home/controller/player_view_ctl.dart';

class PlayerViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PlayerViewCTL());
  }
}
