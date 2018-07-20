import 'dart:async';

import 'package:flutter/services.dart';

export 'get_user_media.dart';
export 'media_stream_track.dart';
export 'media_stream.dart';
export 'rtc_data_channel.dart';
export 'rtc_video_view.dart';
export 'rtc_ice_candidate.dart';
export 'rtc_session_description.dart';
export 'rtc_peerconnection.dart';
export 'rtc_peerconnection_factory.dart';
export 'rtc_stats_report.dart';


enum Log {
  DEBUG,
  WARNING,
  ERROR
}


class Webrtc {
  static const MethodChannel _channel =
      const MethodChannel('webrtc');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


  static Future<String> printLog({Log logType, String tag,  String msg}) async {

    String log = "debug";
    if(logType == Log.WARNING) {
      log = "warning";
    } else if(logType == Log.ERROR) {
      log = "error";
    } else {
      log = "debug";
    }

    final Map<String, dynamic> params = <String, dynamic> {
      'tag': tag,
      'msg': msg,
      'logType': log
    };
    final String result = await _channel.invokeMethod('printLog', params);
    return result;
  }
}
