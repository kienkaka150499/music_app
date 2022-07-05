import 'package:flutter/material.dart';

class Song {
  int songId;
  String imageUrl;
  String songName;
  String singer;
  Duration songTime;

  Song(
      {required this.songId,
      required this.imageUrl,
      required this.songName,
      required this.singer,
      required this.songTime});
}
