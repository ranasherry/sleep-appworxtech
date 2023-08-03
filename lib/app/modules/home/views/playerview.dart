import 'package:applovin_max/applovin_max.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sleep_sounds/app/modules/home/controller/app_lovin_provider.dart';
import 'package:sleep_sounds/app/modules/home/controller/player_view_ctl.dart';
import '../../utills/app_strings.dart';
import '../../utills/size_config.dart';

class PlayerViewer extends GetView<PlayerViewCTL> {
  const PlayerViewer({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        // appBar: AppBar(
        //   title: Obx(
        //     () => Text(
        //       "${controller.title}",
        //       style: TextStyle(
        //           fontSize: SizeConfig.blockSizeHorizontal * 6,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.black),
        //     ),
        //   ),
        //   centerTitle: true,
        //   elevation: 0,
        //   leading: GestureDetector(
        //     onTap: () {
        //       AppLovinProvider.instance.showInterstitial();
        //       Get.back();

        //       controller.stopAudioAndVibration();
        //     },
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: Colors.white,
        //       size: SizeConfig.blockSizeHorizontal * 8,
        //     ),
        //   ),
        // ),
        body: Stack(
      children: [
        Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Obx(
            () => Image.asset(
              controller.mainImage.value,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    AppLovinProvider.instance.showInterstitial();
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: SizeConfig.blockSizeVertical * 1,
                      top: SizeConfig.blockSizeVertical * 5,
                      left: SizeConfig.blockSizeHorizontal * 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 60,
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
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            Obx(
              () => Text(
                "${controller.title}",
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 8,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "Enjoy your Sleep Scene...",
              style: TextStyle(color: Colors.white),
            ),
            verticalSpace(SizeConfig.blockSizeVertical * 2),
            Obx(
              () => GestureDetector(
                onTap: () {
                  if (!controller.isPlaying.value) {
                    print("Line 269");
                    controller.startAudioAndVibration(
                        controller.sound!.value.sound.value);
                  } else {
                    if (controller.isPaused.value) {
                      print("Line 274");
                      controller.isPaused.value = false;
                      controller.resumeAudio();
                    } else {
                      print("Line 278");
                      controller.isPaused.value = true;
                      controller.pauseAudio();
                    }
                  }
                },
                child: Container(
                  height: SizeConfig.blockSizeVertical * 7,
                  width: SizeConfig.blockSizeHorizontal * 20,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Color(0xBB000A1F),
                      shape: BoxShape.circle),
                  child: Icon(
                    controller.check.value ? Icons.pause : Icons.play_arrow,
                    size: SizeConfig.blockSizeHorizontal * 9,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(),
            Column(
              children: [
                Obx(
                  () => CircularCountDownTimer(
                      width: SizeConfig.blockSizeHorizontal * 35,
                      height: SizeConfig.blockSizeVertical * 45,
                      duration: controller.selectedDuration.value,
                      initialDuration: 0,

                      // ringGradient:
                      //     LinearGradient(colors: [Colors.blue, Colors.amber]),
                      fillGradient: LinearGradient(colors: [
                        Color(0xBB335B6B),
                        Color(0xBB000A1F),
                        Color(0xBB2A1F0B)
                      ]),
                      controller: controller.countDownController,
                      autoStart: false,
                      isReverse: true,
                      isReverseAnimation: true,
                      textStyle: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      fillColor: Color(0xFF335B6B),
                      ringColor: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(Container(
                      height: SizeConfig.blockSizeVertical * 40,
                      decoration: BoxDecoration(
                          color: Color(0xFF000A1F),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  SizeConfig.blockSizeHorizontal * 5),
                              topRight: Radius.circular(
                                  SizeConfig.blockSizeHorizontal * 5))),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                left: SizeConfig.blockSizeHorizontal * 3,
                                right: SizeConfig.blockSizeHorizontal * 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    )),
                                Text(
                                  "Set Timer",
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 5,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      controller.selectedDuration.value =
                                          controller.duration.value;
                                      controller.countDownController.restart(
                                          duration: controller
                                              .selectedDuration.value);
                                      if (controller.isPaused.value) {
                                        controller.countDownController.pause();
                                      }
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.done,
                                      color: Colors.green,
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 5),
                            child: Obx(
                              () => NumberPicker(
                                itemWidth: SizeConfig.blockSizeHorizontal * 40,
                                minValue: 300,
                                maxValue: 1800,
                                value: controller.duration.value,
                                step: 300,
                                textMapper: (numberText) {
                                  int number = int.parse(numberText);
                                  int minutes = number ~/ 60;
                                  // int seconds = number % 60;
// :${seconds.toString().padLeft(2, '0')}
                                  return "${minutes.toString().padLeft(2, '0')} min";
                                },
                                onChanged: ((value) => {
                                      controller.duration.value = value,
                                    }),
                                selectedTextStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 7,
                                    color: Colors.white),
                                textStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4,
                                    color: Colors.grey),
                              ),
                            ),
                          )
                        ],
                      ),
                    ));
                  },
                  child: Container(
                    height: SizeConfig.blockSizeVertical * 7,
                    width: SizeConfig.blockSizeHorizontal * 20,
                    decoration: BoxDecoration(
                        color: Color(0xBB000A1F), shape: BoxShape.circle),
                    child: Icon(
                      CupertinoIcons.timer,
                      color: Colors.white,
                      size: SizeConfig.blockSizeHorizontal * 8,
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            Container(
              width: SizeConfig.blockSizeHorizontal * 85,
              child: Text(
                "Sleep music for relax calm and meditations Use headsets for better performance",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}


//        Column(
//         children: [
//           Center(
//             child: Obx(
//               () => Stack(children: [
//                 Container(
//                   margin:
//                       EdgeInsets.only(top: SizeConfig.blockSizeVertical * 10),
//                   width: SizeConfig.blockSizeHorizontal * 92,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(
//                           SizeConfig.blockSizeHorizontal * 5),
//                       border: Border.all(color: Colors.grey.shade700)),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(
//                         SizeConfig.blockSizeHorizontal * 5),
//                     child: Image.asset(
//                       controller.mainImage.value,
//                       height: SizeConfig.blockSizeVertical * 30,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: SizeConfig.blockSizeHorizontal * 30),
//                   child: Obx(
//                     () => CircularCountDownTimer(
//                         width: SizeConfig.blockSizeHorizontal * 35,
//                         height: SizeConfig.blockSizeVertical * 45,
//                         duration: controller.selectedDuration.value,
//                         initialDuration: 0,
//                         controller: controller.countDownController,
//                         autoStart: false,
//                         isReverse: true,
//                         backgroundColor: AppColors.backgroundColor,
//                         isReverseAnimation: true,
//                         textStyle: TextStyle(
//                             fontSize: SizeConfig.blockSizeHorizontal * 10,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                         fillColor: Colors.white,
//                         ringColor: AppColors.backgroundColor),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       top: SizeConfig.blockSizeVertical * 33,
//                       left: SizeConfig.blockSizeHorizontal * 35),
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.bottomSheet(Container(
//                         height: SizeConfig.blockSizeVertical * 40,
//                         decoration: BoxDecoration(
//                             color: AppColors.backgroundColor.withOpacity(1),
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(
//                                     SizeConfig.blockSizeHorizontal * 5),
//                                 topRight: Radius.circular(
//                                     SizeConfig.blockSizeHorizontal * 5))),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: SizeConfig.blockSizeHorizontal * 3),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       Get.back();
//                                     },
//                                     child: Text("Cancel",
//                                         style: TextStyle(
//                                             fontSize:
//                                                 SizeConfig.blockSizeHorizontal *
//                                                     4,
//                                             color: Colors.grey)),
//                                   ),
//                                 ),
//                                 Text(
//                                   "Set Timer",
//                                   style: TextStyle(
//                                       fontSize:
//                                           SizeConfig.blockSizeHorizontal * 5,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     right: SizeConfig.blockSizeHorizontal * 3,
//                                   ),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       controller.selectedDuration.value =
//                                           controller.duration.value;
//                                       controller.countDownController.restart(
//                                           duration: controller
//                                               .selectedDuration.value);
//                                       if (controller.isPaused.value) {
//                                         controller.countDownController.pause();
//                                       }
//                                       Get.back();
//                                     },
//                                     child: Text(
//                                       "Ok",
//                                       style: TextStyle(
//                                           fontSize:
//                                               SizeConfig.blockSizeHorizontal *
//                                                   5,
//                                           color: Colors.indigo),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                   top: SizeConfig.blockSizeVertical * 5),
//                               child: Obx(
//                                 () => NumberPicker(
//                                   itemWidth:
//                                       SizeConfig.blockSizeHorizontal * 40,
//                                   minValue: 300,
//                                   maxValue: 1800,
//                                   value: controller.duration.value,
//                                   step: 300,
//                                   textMapper: (numberText) {
//                                     int number = int.parse(numberText);
//                                     int minutes = number ~/ 60;
//                                     // int seconds = number % 60;
// // :${seconds.toString().padLeft(2, '0')}
//                                     return "${minutes.toString().padLeft(2, '0')} min";
//                                   },
//                                   onChanged: ((value) => {
//                                         controller.duration.value = value,
//                                       }),
//                                   selectedTextStyle: TextStyle(
//                                       fontSize:
//                                           SizeConfig.blockSizeHorizontal * 7,
//                                       color: Colors.white),
//                                   textStyle: TextStyle(
//                                       fontSize:
//                                           SizeConfig.blockSizeHorizontal * 4,
//                                       color: Colors.grey),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ));
//                     },
//                     child: Text(
//                       "Set Timer",
//                       style: TextStyle(
//                           fontSize: SizeConfig.blockSizeHorizontal * 5,
//                           color: Colors.white,
//                           decoration: TextDecoration.underline,
//                           decorationColor: Colors.white),
//                     ),
//                   ),
//                 )
//               ]),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
//             child: Obx(
//               () => Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       controller.setSound(0);
//                     },
//                     child: Icon(
//                       Icons.volume_down,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Container(
//                     width: SizeConfig.blockSizeHorizontal * 70,
//                     child: Slider(
//                       value: controller.soundVolume.value,
//                       onChanged: (newValue) => controller.setSound(newValue),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       controller.setSound(1);
//                     },
//                     child: Icon(
//                       Icons.volume_up,
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
//             child: Obx(
//               () => GestureDetector(
//                 onTap: () {
//                   AppLovinProvider.instance.showInterstitial();
//                   if (!controller.isPlaying.value) {
//                     print("Line 269");
//                     controller.startAudioAndVibration(
//                         controller.sound!.value.sound.value);
//                   } else {
//                     if (controller.isPaused.value) {
//                       print("Line 274");
//                       controller.isPaused.value = false;
//                       controller.resumeAudio();
//                     } else {
//                       print("Line 278");
//                       controller.isPaused.value = true;
//                       controller.pauseAudio();
//                     }
//                   }
//                 },
//                 child: Container(
//                   height: SizeConfig.blockSizeVertical * 5,
//                   width: SizeConfig.blockSizeHorizontal * 25,
//                   decoration: BoxDecoration(
//                       color: Colors.deepPurple,
//                       borderRadius: BorderRadius.circular(
//                           SizeConfig.blockSizeHorizontal * 3)),
//                   child: Icon(
//                     controller.check.value ? Icons.pause : Icons.play_arrow,
//                     color: Colors.white,
//                     size: SizeConfig.blockSizeHorizontal * 9,
//                   ),
//                 ),
//               ),
//             ),
//           ),
       
        // ],
      // ),

