import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utills/images.dart';
import '../../utills/size_config.dart';
import '../controller/splash_screen_ctl.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);
  // Obtain shared preferences.
  bool? b;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        color: Colors.black,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 20,
                  left: SizeConfig.blockSizeHorizontal * 19),
              child: Image.asset(
                AppImages.splash,
                width: SizeConfig.blockSizeHorizontal * 60,
                height: SizeConfig.blockSizeVertical * 30,
                // fit: BoxFit.cover,
              ),
            ),
            // Opacity(
            //   opacity: 0.7,
            //   child: Container(
            //     width: SizeConfig.screenWidth,
            //     height: SizeConfig.screenHeight,
            //     color: Colors.black,
            //   ),
            // ),

            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // verticalSpace(SizeConfig.blockSizeVertical * 5),
                  Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
                    child: Text("Sleep Sounds",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 6,
                            fontWeight: FontWeight.bold)),
                  ),
                  verticalSpace(SizeConfig.blockSizeVertical * 1),
                  Text("Relaxing Sounds for Sleeping",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal * 4,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 5),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 15,
                            right: SizeConfig.blockSizeHorizontal * 15,
                            left: SizeConfig.blockSizeHorizontal * 15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust the radius as per your requirement
                            color: Colors.white,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10), // Same radius as the container
                            child: LinearProgressIndicator(
                                minHeight: 6,
                                backgroundColor: Colors.grey.shade100,
                                color: Color(0xFF322671)),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
