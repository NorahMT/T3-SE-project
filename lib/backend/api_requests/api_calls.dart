import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class YoutubeVideosCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'youtubeVideos',
      apiUrl:
          'https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&q=computer+science+educational&key=AIzaSyBYhc8-OhE2zjDFLC9cHMUh4VjTPwdjkm8',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic itemsVid(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      );
  static dynamic uRLvid(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails''',
        true,
      );
  static dynamic channelTitle(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.channelTitle''',
        true,
      );
  static dynamic videoTitle(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.title''',
        true,
      );
  static dynamic vidDescription(dynamic response) => getJsonField(
        response,
        r'''$.items[:].snippet.description''',
        true,
      );
}

class YoutubeSearchCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'youtubeSearch',
      apiUrl: 'https://youtube-data8.p.rapidapi.com/search/?q=java programming',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '5ae9aafa79msh8a74a4b8155e334p1f0a6djsn78782168e59f',
        'X-RapidAPI-Host': 'youtube-data8.p.rapidapi.com',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic video(dynamic response) => getJsonField(
        response,
        r'''$.contents.*.video''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
