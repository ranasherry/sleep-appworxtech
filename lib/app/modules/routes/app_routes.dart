part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SplashScreen = _Paths.SplashScreen;
  static const HomeView = _Paths.HomeView;
  static const PlayerViewer = _Paths.PlayerViewer;
  static const NavView = _Paths.NavView;
  static const CustomSoundView = _Paths.CustomSoundView;
  static const SettingsView = _Paths.SettingsView;
}

abstract class _Paths {
  static const SplashScreen = '/SplashScreen';
  static const HomeView = '/HomeView';
  static const PlayerViewer = '/PlayerViewer';
  static const NavView = '/NavView';
  static const CustomSoundView = '/CustomSoundView';
  static const SettingsView = '/SettingsView';
}
