import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sleep_sounds/app/data/sleep_sounds_model_view.dart';
import 'package:sleep_sounds/app/modules/utills/images.dart';
import 'package:volume_controller/volume_controller.dart';

class PlayerViewCTL extends GetxController {
  Rx<bool> isPlaying = false.obs;

  AudioCache player = AudioCache();
  AudioPlayer instance = AudioPlayer();

  Rx<SleepSoundModel>? sound;
  Rx<String> mainImage = AppImages.night.obs;
  Rx<String> title = "".obs;
  final RxDouble soundVolume = 0.5.obs;
  RxBool isLoop = false.obs;
  RxBool isPaused = false.obs;
  RxBool check = false.obs;
  Timer? audioTimer;
  final Duration audioDuration = Duration(seconds: 20);
  CountDownController countDownController = CountDownController();
  Rx<int> duration = 600.obs;
  Rx<int> selectedDuration = 600.obs;

  startAudioAndVibration(String t) async {
    isPlaying.value = true;
    check.value = true;
    // AudioCache();
    if (isLoop.value) {
      instance = await player.loop(t);
    } else {
      instance = await player.loop(t);
    }

    audioTimer = Timer(Duration(seconds: selectedDuration.value), () {
      stopAudioAndVibration();
      check.value = false;
    });

    countDownController.start();
    countDownController.restart(duration: selectedDuration.value);

    String? abc = countDownController.getTime();
    print("abc ${abc}");

    instance.onPlayerCompletion.listen((event) {
      // Set the flag to true when the sound is complete
      // Vibration.cancel();
      isPlaying.value = false;
    });
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver;
    // TODO: implement onInit
    super.onInit();
    sound = (Get.arguments as SleepSoundModel).obs;
    title.value = sound!.value.name;
    mainImage.value = sound!.value.mainImage.value;

    VolumeController().getVolume().then((volume) => soundVolume.value = volume);

    VolumeController().listener((volume) {
      soundVolume.value = volume;
      // Vibration.cancel();
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    instance.dispose();
  }

  void setSound(double newValue) {
    soundVolume.value = newValue;
    VolumeController().setVolume(soundVolume.value);
  }

  stopAudioAndVibration() async {
    isPlaying.value = false;
    try {
      await instance.stop();
      audioTimer?.cancel();
      countDownController.reset();
    } catch (e) {}
  }

  playAudio(String h) async {
    try {
      await instance.stop();

      await instance.play(h);
    } catch (e) {}
  }

  Future<void> pauseAudio() async {
    try {
      if (isPlaying.value) {
        await instance.pause();
        check.value = false;
        countDownController.pause();
        isPaused.value = true;
        // isPlaying.value = false;
      }
    } catch (e) {
      print('Error pausing audio: $e');
    }
    print("isPlaying ${isPlaying.value}");
  }

  Future<void> resumeAudio() async {
    try {
      await instance.resume();
      check.value = true;

      // countDownController.restart(duration: selectedDuration.value);
      countDownController.resume();

      if (isPaused.value) {
        await instance.resume();
        isPaused.value = false;
        isPlaying.value = true;
      }
    } catch (e) {
      print('Error resuming audio: $e');
    }
    print("isPlaying ${isPlaying.value}");
  }
}
