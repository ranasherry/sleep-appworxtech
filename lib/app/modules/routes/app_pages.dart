import 'package:get/get.dart';
import 'package:sleep_sounds/app/modules/home/bindings/custom_sound_binding.dart';
import 'package:sleep_sounds/app/modules/home/bindings/nav_view_binding.dart';
import 'package:sleep_sounds/app/modules/home/views/custom_sound_view.dart';
import 'package:sleep_sounds/app/modules/home/views/home_view.dart';
import 'package:sleep_sounds/app/modules/home/views/nav_view.dart';
import 'package:sleep_sounds/app/modules/home/views/playerview.dart';
import 'package:sleep_sounds/app/modules/home/views/settings_view.dart';
import 'package:sleep_sounds/app/modules/home/views/splash_screen.dart';
import '../home/bindings/home_view_binding.dart';
import '../home/bindings/player_view_binding.dart';
import '../home/bindings/settings_binding.dart';
import '../home/bindings/splash_screen_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SplashScreen;

  static final routes = [
    GetPage(
      name: _Paths.SplashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HomeView,
      page: () => HomeView(),
      binding: HomeViewBinding(),
    ),
    GetPage(
      name: _Paths.PlayerViewer,
      page: () => PlayerViewer(),
      binding: PlayerViewerBinding(),
    ),
    GetPage(
      name: _Paths.NavView,
      page: () => NavView(),
      binding: NavViewBinding(),
    ),
    GetPage(
      name: _Paths.CustomSoundView,
      page: () => CustomSoundView(),
      binding: CustomSoundBinding(),
    ),
    GetPage(
      name: _Paths.SettingsView,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
