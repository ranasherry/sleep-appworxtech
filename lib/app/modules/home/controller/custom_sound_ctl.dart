import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sleep_sounds/app/data/more_sounds_model.dart';
import 'package:sleep_sounds/app/modules/utills/images.dart';
import 'package:sleep_sounds/app/modules/utills/sounds.dart';

class CustomSoundCTL extends GetxController {
  RxList<MoreSoundsModel> rain = <MoreSoundsModel>[].obs;
  RxList<MoreSoundsModel> nature = <MoreSoundsModel>[].obs;
  RxList<MoreSoundsModel> animal = <MoreSoundsModel>[].obs;
  RxList<MoreSoundsModel> transport = <MoreSoundsModel>[].obs;
  RxList<MoreSoundsModel> cafe = <MoreSoundsModel>[].obs;
  RxList<MoreSoundsModel> whitenoise = <MoreSoundsModel>[].obs;
  RxList<MoreSoundsModel> meditation = <MoreSoundsModel>[].obs;

  RxList<MoreSoundsModel> selectedSounds = <MoreSoundsModel>[].obs;

  Rx<bool> isPlaying = false.obs;
  AudioCache player = AudioCache();
  AudioPlayer instance = AudioPlayer();
  RxBool isLoop = false.obs;
  RxBool isPaused = false.obs;
  RxBool check = false.obs;

  // Rx<MoreSoundsModel>? more_sound;
  // Rx<String> Icon = "".obs;
  // Rx<String> title = "".obs;

  startAudioAndVibration(MoreSoundsModel sound) async {
    isPlaying.value = true;
    check.value = true;
    // AudioCache();
    if (isLoop.value) {
      // instance = await player.loop(sound.sound.value);
      sound.audioPlayer = await player.loop(sound.sound.value);
    } else {
      print("value of t ${sound.sound.value}");
      // instance = await player.loop(sound.sound.value);
      sound.audioPlayer = await player.loop(sound.sound.value);
    }

    // audioTimer = Timer(Duration(seconds: selectedDuration.value), () {
    //   stopAudioAndVibration();
    //   check.value = false;
    // });

    // countDownController.start();
    // countDownController.restart(duration: selectedDuration.value);

    // String? abc = countDownController.getTime();
    // print("abc ${abc}");

    instance.onPlayerCompletion.listen((event) {
      // Set the flag to true when the sound is complete
      // Vibration.cancel();
      isPlaying.value = false;
    });
  }

  // Function to stop the playback of a specific sound
  void stopSound(MoreSoundsModel sound) {
    if (sound.audioPlayer != null) {
      sound.audioPlayer!.stop();
      if (selectedSounds.length <= 0) {
        sound.isPlaying.value = false;
      }
    }
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver;
    // TODO: implement onInit
    super.onInit();

    fillMoreSounds();
    // more_sound = (Get.arguments as MoreSoundsModel).obs;
    // title.value = more_sound!.value.name;
    // Icon.value = more_sound!.value.icon.value;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  playAudio(String h) async {
    try {
      // await instance.stop();

      await instance.play(h);
    } catch (e) {
      print("e ${e}");
    }
  }

  void toggleSoundSelection(MoreSoundsModel sound) {
    if (selectedSounds.contains(sound)) {
      // If the sound is already selected, remove it from the list and stop its playback
      selectedSounds.remove(sound);
      stopSound(sound);
    } else {
      if (selectedSounds.length >= 10) {
        Fluttertoast.showToast(
            msg: "Maximum number of sounds reached (10).",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 14.0);
        return;
      }
      // If the sound is not selected, add it to the list and start its playback
      selectedSounds.add(sound);

      startAudioAndVibration(sound);
    }
  }

  // void toggleSoundSelection(MoreSoundsModel sound) {
  //   if (selectedSounds.contains(sound)) {
  //     // If the sound is already selected, remove it from the list and stop its playback
  //     selectedSounds.remove(sound);
  //     stopSound(sound);
  //   } else {
  //     // If the sound is not selected, add it to the list
  //     selectedSounds.add(sound);
  //   }
  // }

  Future<void> togglePlayPause(MoreSoundsModel sound) async {
    if (sound.isPlaying.value) {
      // Pause the sound
      await instance.pause();
      sound.isPlaying.value = false;
    } else {
      // Play the sound
      await instance.play(sound.sound.value);
      sound.isPlaying.value = true;
    }
  }

  Future<void> playSelectedSounds() async {
    if (selectedSounds.isEmpty) return;

    // Play the selected sounds
    isPlaying.value = true;
    for (final sound in selectedSounds) {
      print("selectedsoundname ${sound.name}");
      print("selectedsoundpath ${sound.sound}");
      // await instance.play(sound.sound.value);
      sound.isPlaying.value = true;
      startAudioAndVibration(sound);
      // playAudio(sound.sound.value);
    }
  }

  Future<void> stopSelectedSounds() async {
    if (selectedSounds.isEmpty) return;

    // Play the selected sounds
    for (final sound in selectedSounds) {
      print("selectedsoundname ${sound.name}");
      print("selectedsoundpath ${sound.sound}");
      // await instance.play(sound.sound.value);
      sound.isPlaying.value = true;
      stopSound(sound);
      // playAudio(sound.sound.value);
    }
    isPlaying.value = false;
  }

  void fillMoreSounds() async {
    // Rain and Thunder
    MoreSoundsModel lightrain = MoreSoundsModel(
      name: "LightRain",
      icon: CustomImages.lightRain.obs,
      sound: customSounds.lightRain.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    rain.add(lightrain);

    MoreSoundsModel heavyrain = MoreSoundsModel(
      name: "Heavy Rain",
      icon: CustomImages.heavyRain.obs,
      sound: customSounds.heavyRain.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    rain.add(heavyrain);

    MoreSoundsModel thunder = MoreSoundsModel(
      name: "Thunder",
      icon: CustomImages.thunder.obs,
      sound: customSounds.thunder.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    rain.add(thunder);

    MoreSoundsModel roofrain = MoreSoundsModel(
      name: "Rain on Roof",
      icon: CustomImages.roof.obs,
      sound: customSounds.roof.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    rain.add(roofrain);

    MoreSoundsModel windowrain = MoreSoundsModel(
      name: "Rain on Window",
      icon: CustomImages.window.obs,
      sound: customSounds.window.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    rain.add(windowrain);

    MoreSoundsModel snow = MoreSoundsModel(
      name: "Snow",
      icon: CustomImages.snow.obs,
      sound: customSounds.snow.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    rain.add(snow);

    MoreSoundsModel umbrellarain = MoreSoundsModel(
      name: "Rain on Umbrella",
      icon: CustomImages.umbrella.obs,
      sound: customSounds.umbrella.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    rain.add(umbrellarain);

    MoreSoundsModel tentrain = MoreSoundsModel(
      name: "Rain on Tent",
      icon: CustomImages.tent.obs,
      sound: customSounds.tent.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    rain.add(tentrain);

    MoreSoundsModel puddle = MoreSoundsModel(
      name: "puddle",
      icon: CustomImages.puddle.obs,
      sound: customSounds.puddle.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    rain.add(puddle);

    // Nature

    MoreSoundsModel birdforest = MoreSoundsModel(
      name: "Ocean",
      icon: CustomImages.ocean.obs,
      sound: customSounds.ocean.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    nature.add(birdforest);

    MoreSoundsModel lake = MoreSoundsModel(
      name: "Lake",
      icon: CustomImages.lake.obs,
      sound: customSounds.lake.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    nature.add(lake);

    MoreSoundsModel creek = MoreSoundsModel(
      name: "Creek",
      icon: CustomImages.creek.obs,
      sound: customSounds.creek.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    nature.add(creek);

    MoreSoundsModel forest = MoreSoundsModel(
      name: "Forest",
      icon: CustomImages.forest.obs,
      sound: customSounds.forest.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    nature.add(forest);

    MoreSoundsModel windleaves = MoreSoundsModel(
      name: "Wind Leaves",
      icon: CustomImages.windLeaves.obs,
      sound: customSounds.windLeaves.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    nature.add(windleaves);

    MoreSoundsModel wind = MoreSoundsModel(
      name: "Wind",
      icon: CustomImages.wind.obs,
      sound: customSounds.wind.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    nature.add(wind);

    MoreSoundsModel waterfall = MoreSoundsModel(
      name: "WaterFall",
      icon: CustomImages.waterfall.obs,
      sound: customSounds.waterFall.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    nature.add(waterfall);

    MoreSoundsModel drip = MoreSoundsModel(
      name: "Drip",
      icon: CustomImages.drip.obs,
      sound: customSounds.drip.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    nature.add(drip);

    MoreSoundsModel underwater = MoreSoundsModel(
      name: "UnderWater",
      icon: CustomImages.underwater.obs,
      sound: customSounds.underwater.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    nature.add(underwater);

    MoreSoundsModel farm = MoreSoundsModel(
      name: "Farm",
      icon: CustomImages.farm.obs,
      sound: customSounds.farm.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    nature.add(farm);

    MoreSoundsModel grassland = MoreSoundsModel(
      name: "Grassland",
      icon: CustomImages.grassland.obs,
      sound: customSounds.grassland.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    nature.add(grassland);

    MoreSoundsModel fire = MoreSoundsModel(
      name: "Fire",
      icon: CustomImages.fire.obs,
      sound: customSounds.fire.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    nature.add(fire);

    // Animal

    MoreSoundsModel bird = MoreSoundsModel(
      name: "Bird",
      icon: CustomImages.bird.obs,
      sound: customSounds.bird.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    animal.add(bird);

    MoreSoundsModel bird2 = MoreSoundsModel(
      name: "Bird2",
      icon: CustomImages.bird2.obs,
      sound: customSounds.bird2.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    animal.add(bird2);

    MoreSoundsModel seagull = MoreSoundsModel(
      name: "Seagull",
      icon: CustomImages.seagull.obs,
      sound: customSounds.seagull.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    animal.add(seagull);

    MoreSoundsModel frog = MoreSoundsModel(
      name: "Frog",
      icon: CustomImages.frog.obs,
      sound: customSounds.frog.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    animal.add(frog);

    MoreSoundsModel frog2 = MoreSoundsModel(
      name: "Frog2",
      icon: CustomImages.frog2.obs,
      sound: customSounds.frog2.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    animal.add(frog2);

    MoreSoundsModel cricket = MoreSoundsModel(
      name: "Cricket",
      icon: CustomImages.cricket.obs,
      sound: customSounds.cricket.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    animal.add(cricket);

    MoreSoundsModel cicada = MoreSoundsModel(
      name: "Cicada",
      icon: CustomImages.cicada.obs,
      sound: customSounds.cicada.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    animal.add(cicada);

    MoreSoundsModel wolf = MoreSoundsModel(
      name: "Wolf",
      icon: CustomImages.wolf.obs,
      sound: customSounds.wolf.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    animal.add(wolf);

    MoreSoundsModel loon = MoreSoundsModel(
      name: "Loon",
      icon: CustomImages.loon.obs,
      sound: customSounds.loon.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    animal.add(loon);

    // Transport

    MoreSoundsModel train = MoreSoundsModel(
      name: "Train",
      icon: CustomImages.train.obs,
      sound: customSounds.train.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    transport.add(train);

    MoreSoundsModel car = MoreSoundsModel(
      name: "Car",
      icon: CustomImages.car.obs,
      sound: customSounds.car.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    transport.add(car);

    MoreSoundsModel airplane = MoreSoundsModel(
      name: "Airplane",
      icon: CustomImages.airplane.obs,
      sound: customSounds.airplane.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    transport.add(airplane);

    // Cafe and Instrument

    MoreSoundsModel cafee = MoreSoundsModel(
      name: "Cafe",
      icon: CustomImages.cafe.obs,
      sound: customSounds.cafe.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    cafe.add(cafee);

    MoreSoundsModel crowd = MoreSoundsModel(
      name: "Crowd",
      icon: CustomImages.crowd.obs,
      sound: customSounds.crowd.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    cafe.add(crowd);

    MoreSoundsModel heartbeat = MoreSoundsModel(
      name: "Heart Beat",
      icon: CustomImages.heartbeat.obs,
      sound: customSounds.heartbeat.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    cafe.add(heartbeat);

    MoreSoundsModel construction = MoreSoundsModel(
      name: "Construction Site",
      icon: CustomImages.construction.obs,
      sound: customSounds.construction.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    cafe.add(construction);

    MoreSoundsModel lullaby = MoreSoundsModel(
      name: "Lullaby",
      icon: CustomImages.lullaby.obs,
      sound: customSounds.lullaby.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    cafe.add(lullaby);

    MoreSoundsModel dryer = MoreSoundsModel(
      name: "Dryer",
      icon: CustomImages.dryer.obs,
      sound: customSounds.dryer.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    cafe.add(dryer);

    MoreSoundsModel hairdryer = MoreSoundsModel(
      name: "Hair Dryer",
      icon: CustomImages.hairDryer.obs,
      sound: customSounds.hairDryer.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    cafe.add(hairdryer);

    MoreSoundsModel vaccum = MoreSoundsModel(
      name: "Vacuum Cleaner",
      icon: CustomImages.vacuum.obs,
      sound: customSounds.vacuumCleaner.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    cafe.add(vaccum);

    MoreSoundsModel fan = MoreSoundsModel(
      name: "Fan",
      icon: CustomImages.fan.obs,
      sound: customSounds.fan.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    cafe.add(fan);

    // White Noise

    MoreSoundsModel white = MoreSoundsModel(
      name: "White Noise",
      icon: CustomImages.white.obs,
      sound: customSounds.white.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    whitenoise.add(white);

    MoreSoundsModel brown = MoreSoundsModel(
      name: "Brown Noise",
      icon: CustomImages.brown.obs,
      sound: customSounds.brown.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    whitenoise.add(brown);

    MoreSoundsModel pink = MoreSoundsModel(
      name: "Pink Noise",
      icon: CustomImages.pink.obs,
      sound: customSounds.pink.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    whitenoise.add(pink);

    // Meditation

    MoreSoundsModel guitar = MoreSoundsModel(
      name: "Guitar",
      icon: CustomImages.guitar.obs,
      sound: customSounds.guitar.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    meditation.add(guitar);

    MoreSoundsModel piano = MoreSoundsModel(
      name: "Piano",
      icon: CustomImages.piano.obs,
      sound: customSounds.piano.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    meditation.add(piano);

    MoreSoundsModel flute = MoreSoundsModel(
      name: "Flute",
      icon: CustomImages.flute.obs,
      sound: customSounds.flute.obs,
      isPlaying: false.obs,
      audioPlayer: null,
    );
    meditation.add(flute);
  }
}
