import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _initialSearch = prefs.getString('ff_initialSearch') ?? _initialSearch;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _addFav = false;
  bool get addFav => _addFav;
  set addFav(bool _value) {
    _addFav = _value;
  }

  String _courseName = '';
  String get courseName => _courseName;
  set courseName(String _value) {
    _courseName = _value;
  }

  List<dynamic> _SearchResults = [];
  List<dynamic> get SearchResults => _SearchResults;
  set SearchResults(List<dynamic> _value) {
    _SearchResults = _value;
  }

  void addToSearchResults(dynamic _value) {
    _SearchResults.add(_value);
  }

  void removeFromSearchResults(dynamic _value) {
    _SearchResults.remove(_value);
  }

  void removeAtIndexFromSearchResults(int _index) {
    _SearchResults.removeAt(_index);
  }

  void updateSearchResultsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _SearchResults[_index] = updateFn(_SearchResults[_index]);
  }

  void insertAtIndexInSearchResults(int _index, dynamic _value) {
    _SearchResults.insert(_index, _value);
  }

  String _initialSearch = 'Introduction to java';
  String get initialSearch => _initialSearch;
  set initialSearch(String _value) {
    _initialSearch = _value;
    prefs.setString('ff_initialSearch', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
