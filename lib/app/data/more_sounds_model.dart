
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MoreSoundsModel {
  MoreSoundsModel({
    required this.name,
    required this.icon,
    required this.sound,
    required this.isPlaying,
    required this.audioPlayer,
  });

  String name;
  RxString icon;
  RxString sound;
  RxBool isPlaying;
  AudioPlayer? audioPlayer;
}
