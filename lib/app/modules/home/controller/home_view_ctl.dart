import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleep_sounds/app/modules/home/controller/app_lovin_provider.dart';

import '../../../data/sleep_sounds_model_view.dart';
import '../../utills/app_strings.dart';
import '../../utills/images.dart';

class HomeViewCTL extends GetxController with WidgetsBindingObserver {
  RxList<SleepSoundModel> SleepSounds = <SleepSoundModel>[].obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver;
    // TODO: implement onInit
    super.onInit();
    fillSleepSounds();
    if (AppLovinProvider.instance.isInitialized.value) {
      AppLovinMAX.setAppOpenAdListener(AppOpenAdListener(
        onAdLoadedCallback: (ad) {},
        onAdLoadFailedCallback: (adUnitId, error) {},
        onAdDisplayedCallback: (ad) {},
        onAdDisplayFailedCallback: (ad, error) {
          AppLovinMAX.loadAppOpenAd(AppStrings.MAX_APPOPEN_ID);
        },
        onAdClickedCallback: (ad) {},
        onAdHiddenCallback: (ad) {
          AppLovinMAX.loadAppOpenAd(AppStrings.MAX_APPOPEN_ID);
        },
        onAdRevenuePaidCallback: (ad) {},
      ));

      AppLovinMAX.loadAppOpenAd(AppStrings.MAX_APPOPEN_ID);
    }

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    print("AppState  : ${state}");
    switch (state) {
      case AppLifecycleState.resumed:
        await showAdIfReady();
        print("App Resume :");
        break;

      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        break;
    }
  }

  Future<void> showAdIfReady() async {
    if (!AppLovinProvider.instance.isInitialized.value) {
      return;
    }

    bool isReady =
        (await AppLovinMAX.isAppOpenAdReady(AppStrings.MAX_APPOPEN_ID))!;
    if (isReady) {
      AppLovinMAX.showAppOpenAd(AppStrings.MAX_APPOPEN_ID);
    } else {
      AppLovinMAX.loadAppOpenAd(AppStrings.MAX_APPOPEN_ID);
    }
  }

  void fillSleepSounds() async {
    SleepSoundModel sleep1 = SleepSoundModel(
        name: "Ocean",
        mainImage: AppImages.ocean.obs,
        sound: "sounds/ocean.mp3".obs);
    SleepSounds.add(sleep1);

    SleepSoundModel sleep2 = SleepSoundModel(
        name: "Forest",
        mainImage: AppImages.forest.obs,
        sound: "sounds/forest.mp3".obs);
    SleepSounds.add(sleep2);

    SleepSoundModel sleep3 = SleepSoundModel(
        name: "Rain",
        mainImage: AppImages.rain.obs,
        sound: "sounds/rain.mp3".obs);
    SleepSounds.add(sleep3);

    SleepSoundModel sleep4 = SleepSoundModel(
        name: "Night",
        mainImage: AppImages.night.obs,
        sound: "sounds/night.mp3".obs);
    SleepSounds.add(sleep4);

    SleepSoundModel sleep5 = SleepSoundModel(
        name: "Lake",
        mainImage: AppImages.lake.obs,
        sound: "sounds/lake.mp3".obs);
    SleepSounds.add(sleep5);

    SleepSoundModel sleep6 = SleepSoundModel(
        name: "Creek",
        mainImage: AppImages.creek.obs,
        sound: "sounds/creek.mp3".obs);
    SleepSounds.add(sleep6);

    SleepSoundModel sleep7 = SleepSoundModel(
        name: "Grassland",
        mainImage: AppImages.grassland.obs,
        sound: "sounds/grassland.mp3".obs);
    SleepSounds.add(sleep7);

    SleepSoundModel sleep8 = SleepSoundModel(
        name: "Cave",
        mainImage: AppImages.cave.obs,
        sound: "sounds/cave.mp3".obs);
    SleepSounds.add(sleep8);

    SleepSoundModel sleep9 = SleepSoundModel(
        name: "Farm",
        mainImage: AppImages.farm.obs,
        sound: "sounds/farm.mp3".obs);
    SleepSounds.add(sleep9);

    SleepSoundModel sleep10 = SleepSoundModel(
        name: "Fire",
        mainImage: AppImages.fire.obs,
        sound: "sounds/fire.mp3".obs);
    SleepSounds.add(sleep10);

    SleepSoundModel sleep11 = SleepSoundModel(
        name: "Waterfall",
        mainImage: AppImages.waterfall.obs,
        sound: "sounds/waterfall.mp3".obs);
    SleepSounds.add(sleep11);

    SleepSoundModel sleep12 = SleepSoundModel(
        name: "Underwater",
        mainImage: AppImages.underwater.obs,
        sound: "sounds/underwater.mp3".obs);
    SleepSounds.add(sleep12);

    SleepSoundModel sleep13 = SleepSoundModel(
        name: "Airplane",
        mainImage: AppImages.airplane.obs,
        sound: "custom_sounds/airplane.mp3".obs);
    SleepSounds.add(sleep13);

    SleepSoundModel sleep14 = SleepSoundModel(
        name: "Cafe",
        mainImage: AppImages.cafe.obs,
        sound: "custom_sounds/cafe.mp3".obs);
    SleepSounds.add(sleep14);

    SleepSoundModel sleep15 = SleepSoundModel(
        name: "Train",
        mainImage: AppImages.train.obs,
        sound: "custom_sounds/train.mp3".obs);
    SleepSounds.add(sleep15);
  }
}
