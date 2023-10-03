import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleep_sounds/app/modules/home/controller/settings_ctl.dart';

import '../../utills/app_strings.dart';
import '../../utills/images.dart';
import '../../utills/size_config.dart';

class SettingsView extends GetView<SettingsCTL> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ),
        child: Column(children: [
          Container(
            // width: SizeConfig.blockSizeHorizontal * 40,
            child: Center(
              child: Text(
                "Settings",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          settings_btn(
              "Rate us",
              CupertinoIcons.hand_thumbsup_fill,
              "Help us to grow with your 5 star",
              Icons.arrow_forward_ios_rounded),
          GestureDetector(
            onTap: () {
              controller.ShareApp();
            },
            child: settings_btn("Invite your friends", Icons.person_add_alt_1,
                "Spread the World", Icons.arrow_forward_ios_rounded),
          ),
          Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
            // height: 60,
            // color: Colors.amber,
            child: Center(
              child: MaxAdView(
                  adUnitId: AppStrings.MAX_BANNER_ID,
                  adFormat: AdFormat.banner,
                  listener: AdViewAdListener(onAdLoadedCallback: (ad) {
                    print('Banner widget ad loaded from ' + ad.networkName);
                  }, onAdLoadFailedCallback: (adUnitId, error) {
                    print('Banner widget ad failed to load with error code ' +
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
          Spacer(),
          Text(
            "Sleep Sounds",
            style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 4,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Text(
            "Version: 1.0.2",
            style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 3,
                color: Colors.white),
          )
        ]),
      )
    ]));
  }

  Padding settings_btn(
      String text1, IconData icon1, String text2, IconData icon2) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 4,
          left: SizeConfig.blockSizeHorizontal * 7,
          right: SizeConfig.blockSizeHorizontal * 5),
      child: Row(
        children: [
          Icon(
            icon1,
            color: Colors.white,
            size: SizeConfig.blockSizeHorizontal * 7,
          ),
          horizontalSpace(SizeConfig.blockSizeHorizontal * 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                text2,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3,
                    color: Colors.blue),
              )
            ],
          ),
          Spacer(),
          Icon(
            icon2,
            color: Colors.white,
            size: SizeConfig.blockSizeHorizontal * 6,
          )
        ],
      ),
    );
  }
}
