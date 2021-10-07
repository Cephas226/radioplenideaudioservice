// import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
// import 'package:flutter_ffmpeg/media_information.dart';

// abstract class PlaylistRepository {
//   Future<List<Map<String, String>>> fetchInitialPlaylist();
//   // Future<Map<String, String>> fetchAnotherSong();
// }

// class DemoPlaylist extends PlaylistRepository {
//   @override
//   Future<List<Map<String, String>>> fetchInitialPlaylist(
//       {int length = 1}) async {
//     return List.generate(length, (index) => _nextSong());
//   }

//   // @override
//   // Future<Map<String, String>> fetchAnotherSong() async {
//   //   return _nextSong();
//   // }

//   var _songIndex = 0;
//   static const _maxSongNumber = 16;
//   MediaInformation? streamData;
//   String streamTitle = "";
//   MediaInformation? mediaInformation;
//   initStream() async {
//     final FlutterFFprobe _probe = new FlutterFFprobe();
//     mediaInformation = await _probe.getMediaInformation(
//         "https://www.radioking.com/play/radioplenitudesvie");
//     Map<dynamic, dynamic>? mp = mediaInformation!.getMediaProperties();
//     streamTitle = mp!["tags"]["StreamTitle"];
//   }

//   Map<String, String> _nextSong() {
//     _songIndex = (_songIndex % _maxSongNumber) + 1;
//     return {
//       'id': _songIndex.toString().padLeft(3, '0'),
//       "title":streamTitle.toString(),
//       'url': 'https://www.radioking.com/play/radioplenitudesvie',
//     };
//   }
// }

import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_ffmpeg/media_information.dart';

abstract class PlaylistRepository {
  Future<List<Map<String, String>>> fetchInitialPlaylist();
  Future<Map<String, String>> fetchAnotherSong();
}

class DemoPlaylist extends PlaylistRepository {
  @override
  Future<List<Map<String, String>>> fetchInitialPlaylist(
      {int length = 3}) async {
    return List.generate(length, (index) => _nextSong());
  }

  @override
  Future<Map<String, String>> fetchAnotherSong() async {
    return _nextSong();
  }
    MediaInformation? streamData;
  String streamTitle = "";
  MediaInformation? mediaInformation;
  initStream() async {
    final FlutterFFprobe _probe = new FlutterFFprobe();
    mediaInformation = await _probe.getMediaInformation(
        "https://www.radioking.com/play/radioplenitudesvie");
    Map<dynamic, dynamic>? mp = mediaInformation!.getMediaProperties();
    streamTitle = mp!["tags"]["StreamTitle"];
    print(streamTitle.toString());
  }
  var _songIndex = 0;
  static const _maxSongNumber = 16;

  Map<String, String> _nextSong() {
    _songIndex = (_songIndex % _maxSongNumber) + 1;
    return {
      'id': _songIndex.toString().padLeft(3, '0'),
      'title': streamTitle.toString(),
      'url':
          'https://www.radioking.com/play/radioplenitudesvie',
    };
  }
}