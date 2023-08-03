import 'package:get/get.dart';

class SleepSoundModel {
  SleepSoundModel({
    required this.name,
    required this.mainImage,
    required this.sound,
  });

  String name;
  RxString mainImage;
  RxString sound;
}
