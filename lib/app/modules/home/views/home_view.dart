import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleep_sounds/app/data/sleep_sounds_model_view.dart';
import 'package:sleep_sounds/app/modules/home/controller/app_lovin_provider.dart';
import 'package:sleep_sounds/app/modules/home/controller/home_view_ctl.dart';
import 'package:sleep_sounds/app/modules/utills/images.dart';

import '../../routes/app_pages.dart';
import '../../utills/app_strings.dart';
import '../../utills/size_config.dart';

class HomeView extends GetView<HomeViewCTL> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AppLovinProvider.instance.init();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Sleep Sounds",
      //     style: TextStyle(
      //         fontSize: SizeConfig.blockSizeHorizontal * 6,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: Stack(children: [
        Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Image.asset(
            AppImages.background,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 5,
            // bottom: SizeConfig.blockSizeVertical * 9
          ),
          child: Column(
            children: [
              Container(
                // width: SizeConfig.blockSizeHorizontal * 40,
                child: Center(
                  child: Text(
                    "Sleep Scenes",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 6,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 2),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: SizeConfig.blockSizeHorizontal * 3,
                  ),
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 2,
                      right: SizeConfig.blockSizeHorizontal * 2),
                  children: [
                    sleep_btn(
                        0, controller.SleepSounds, "Ocean", AppImages.ocean),
                    sleep_btn(
                        1, controller.SleepSounds, "Forest", AppImages.forest),
                    sleep_btn(
                        2, controller.SleepSounds, "Rain", AppImages.rain),
                    sleep_btn(
                        3, controller.SleepSounds, "Night", AppImages.night),
                    sleep_btn(
                        4, controller.SleepSounds, "Lake", AppImages.lake),
                    sleep_btn(
                        5, controller.SleepSounds, "Creek", AppImages.creek),
                    sleep_btn(6, controller.SleepSounds, "Grassland",
                        AppImages.grassland),
                    sleep_btn(
                        7, controller.SleepSounds, "Cave", AppImages.cave),
                    sleep_btn(
                        8, controller.SleepSounds, "Farm", AppImages.farm),
                    sleep_btn(
                        9, controller.SleepSounds, "Fire", AppImages.fire),
                    sleep_btn(10, controller.SleepSounds, "Waterfall",
                        AppImages.waterfall),
                    sleep_btn(11, controller.SleepSounds, "Underwater",
                        AppImages.underwater),
                    sleep_btn(12, controller.SleepSounds, "Airplane",
                        AppImages.airplane),
                    sleep_btn(
                        13, controller.SleepSounds, "Cafe", AppImages.cafe),
                    sleep_btn(
                        14, controller.SleepSounds, "Train", AppImages.train),
                  ],
                ),
              ),
              Container(
                // height: 60,
                // color: Colors.amber,
                child: Center(
                  child: MaxAdView(
                      adUnitId: AppStrings.MAX_BANNER_ID,
                      adFormat: AdFormat.banner,
                      listener: AdViewAdListener(onAdLoadedCallback: (ad) {
                        print('Banner widget ad loaded from ' + ad.networkName);
                      }, onAdLoadFailedCallback: (adUnitId, error) {
                        print(
                            'Banner widget ad failed to load with error code ' +
                                error.code.toString() +
                                ' and message: ' +
                                error.message);
                      }, onAdClickedCallback: (ad) {
                        print('Banner widget ad clicked');
                      }, onAdExpandedCallback: (ad) {
                        print('Banner widget ad expanded');
                      }, onAdCollapsedCallback: (ad) {
                        print('Banner widget ad collapsed');
                      })),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  GestureDetector sleep_btn(
      int index, List<SleepSoundModel> soundList, String text, String image) {
    SleepSoundModel sound = soundList[index];

    return GestureDetector(
      onTap: () {
        AppLovinProvider.instance.showInterstitial();
        Get.toNamed(Routes.PlayerViewer, arguments: sound);
      },
      child: Container(
          width: SizeConfig.blockSizeHorizontal * 45,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 2),
                      child: Image.asset(
                        image,
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.blockSizeVertical * 20,
                        fit: BoxFit.cover,
                      )),
                  Container(
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        color: Color(0xBB1E1E1E),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                                SizeConfig.blockSizeHorizontal * 2),
                            bottomRight: Radius.circular(
                                SizeConfig.blockSizeHorizontal * 2))),
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 5,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
