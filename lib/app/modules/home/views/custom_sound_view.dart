import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleep_sounds/app/data/more_sounds_model.dart';
import 'package:sleep_sounds/app/modules/home/controller/app_lovin_provider.dart';
import 'package:sleep_sounds/app/modules/home/controller/custom_sound_ctl.dart';
import '../../utills/images.dart';
import '../../utills/size_config.dart';

class CustomSoundView extends GetView<CustomSoundCTL> {
  const CustomSoundView({super.key});

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
      SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
              child: Text(
                "Sleep Sounds",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 5,
                top: SizeConfig.blockSizeVertical * 1),
            child: Text(
              "Rain",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 5,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.7 / 2,
                crossAxisCount: 3,
                crossAxisSpacing: SizeConfig.blockSizeHorizontal * 3,
                mainAxisSpacing: SizeConfig.blockSizeHorizontal * 3),
            children: [
              more_sounds_btn(0, controller.rain),
              more_sounds_btn(1, controller.rain),
              more_sounds_btn(2, controller.rain),
              more_sounds_btn(3, controller.rain),
              more_sounds_btn(4, controller.rain),
              more_sounds_btn(5, controller.rain),
              more_sounds_btn(6, controller.rain),
              more_sounds_btn(7, controller.rain),
              more_sounds_btn(8, controller.rain),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 5,
                top: SizeConfig.blockSizeVertical * 1),
            child: Text(
              "Nature",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 5,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.7 / 2,
                crossAxisCount: 3,
                crossAxisSpacing: SizeConfig.blockSizeHorizontal * 3,
                mainAxisSpacing: SizeConfig.blockSizeHorizontal * 3),
            children: [
              more_sounds_btn(0, controller.nature),
              more_sounds_btn(1, controller.nature),
              more_sounds_btn(2, controller.nature),
              more_sounds_btn(3, controller.nature),
              more_sounds_btn(4, controller.nature),
              more_sounds_btn(5, controller.nature),
              more_sounds_btn(6, controller.nature),
              more_sounds_btn(7, controller.nature),
              more_sounds_btn(8, controller.nature),
              more_sounds_btn(9, controller.nature),
              more_sounds_btn(10, controller.nature),
              more_sounds_btn(11, controller.nature),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 5,
                top: SizeConfig.blockSizeVertical * 1),
            child: Text(
              "Animal",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 5,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.7 / 2,
                crossAxisCount: 3,
                crossAxisSpacing: SizeConfig.blockSizeHorizontal * 3,
                mainAxisSpacing: SizeConfig.blockSizeHorizontal * 3),
            children: [
              more_sounds_btn(0, controller.animal),
              more_sounds_btn(1, controller.animal),
              more_sounds_btn(2, controller.animal),
              more_sounds_btn(3, controller.animal),
              more_sounds_btn(4, controller.animal),
              more_sounds_btn(5, controller.animal),
              more_sounds_btn(6, controller.animal),
              more_sounds_btn(7, controller.animal),
              more_sounds_btn(8, controller.animal),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 5,
                top: SizeConfig.blockSizeVertical * 1),
            child: Text(
              "Transport",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 5,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.7 / 2,
                crossAxisCount: 3,
                crossAxisSpacing: SizeConfig.blockSizeHorizontal * 3,
                mainAxisSpacing: SizeConfig.blockSizeHorizontal * 3),
            children: [
              more_sounds_btn(0, controller.transport),
              more_sounds_btn(1, controller.transport),
              more_sounds_btn(2, controller.transport),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 5,
                top: SizeConfig.blockSizeVertical * 1),
            child: Text(
              "City and Instrument",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 5,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.7 / 2,
                crossAxisCount: 3,
                crossAxisSpacing: SizeConfig.blockSizeHorizontal * 3,
                mainAxisSpacing: SizeConfig.blockSizeHorizontal * 3),
            children: [
              more_sounds_btn(0, controller.cafe),
              more_sounds_btn(1, controller.cafe),
              more_sounds_btn(2, controller.cafe),
              more_sounds_btn(3, controller.cafe),
              more_sounds_btn(4, controller.cafe),
              more_sounds_btn(5, controller.cafe),
              more_sounds_btn(6, controller.cafe),
              more_sounds_btn(7, controller.cafe),
              more_sounds_btn(8, controller.cafe),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 5,
                top: SizeConfig.blockSizeVertical * 1),
            child: Text(
              "White Noise",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 5,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.7 / 2,
                crossAxisCount: 3,
                crossAxisSpacing: SizeConfig.blockSizeHorizontal * 3,
                mainAxisSpacing: SizeConfig.blockSizeHorizontal * 3),
            children: [
              more_sounds_btn(0, controller.whitenoise),
              more_sounds_btn(1, controller.whitenoise),
              more_sounds_btn(2, controller.whitenoise),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 5,
                top: SizeConfig.blockSizeVertical * 1),
            child: Text(
              "Meditation",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 5,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          GridView(
            padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 8),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.7 / 2,
                crossAxisCount: 3,
                crossAxisSpacing: SizeConfig.blockSizeHorizontal * 3,
                mainAxisSpacing: SizeConfig.blockSizeHorizontal * 3),
            children: [
              more_sounds_btn(0, controller.meditation),
              more_sounds_btn(1, controller.meditation),
              more_sounds_btn(2, controller.meditation),
            ],
          ),
        ]),
      ),
      Obx(
        () => Align(
            alignment: Alignment.bottomCenter,
            child: controller.selectedSounds.length <= 0
                ? Container()
                : Container(
                    margin: EdgeInsets.only(
                        bottom: SizeConfig.blockSizeVertical * 2),
                    height: SizeConfig.blockSizeVertical * 7,
                    width: SizeConfig.blockSizeHorizontal * 50,
                    decoration: BoxDecoration(
                        color: Color(0xFF010C21),
                        // gradient: LinearGradient(
                        //     colors: [Color(0xFF000A1F), Color(0xFF002940)],
                        //     begin: Alignment.topCenter,
                        //     end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.circular(
                            SizeConfig.blockSizeHorizontal * 4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          CupertinoIcons.timer,
                          color: Colors.transparent,
                          size: SizeConfig.blockSizeHorizontal * 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.isPlaying.value) {
                              controller.stopSelectedSounds();
                            } else {
                              controller.playSelectedSounds();
                            }
                          },
                          child: Icon(
                            controller.isPlaying.value
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: SizeConfig.blockSizeHorizontal * 9,
                          ),
                        ),
                        Icon(
                          Icons.volume_up,
                          color: Colors.transparent,
                          size: SizeConfig.blockSizeHorizontal * 8,
                        )
                      ],
                    ),
                  )),
      ),
    ]));
  }

  Column more_sounds_btn(
    int index,
    List<MoreSoundsModel> moreSoundsList,
    // String text, String image
  ) {
    MoreSoundsModel customSound = moreSoundsList[index];

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            AppLovinProvider.instance.showInterstitial();
            controller.toggleSoundSelection(customSound);
          },
          child: Obx(
            () => Container(
                height: SizeConfig.blockSizeVertical * 12,
                width: SizeConfig.blockSizeHorizontal * 22,
                decoration: BoxDecoration(
                  // color: Color(0xBB000A1F),
                  gradient: LinearGradient(
                      colors: controller.selectedSounds.contains(customSound)
                          ? [Color(0xFF124455), Colors.white60]
                          : [Color(0xFF010C21), Color(0xFF124455)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius:
                      BorderRadius.circular(SizeConfig.blockSizeHorizontal * 3),
                  // border: Border.all(color: Color(0xFF034151))
                ),
                child: Image.asset(
                  customSound.icon.value,
                  color: Colors.white,
                  scale: 1.5,
                )),
          ),
        ),
        verticalSpace(SizeConfig.blockSizeVertical * 1),
        Text(
          customSound.name,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
