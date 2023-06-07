import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _apiKey = prefs.getString('ff_apiKey') ?? _apiKey;
    });
    _safeInit(() {
      _isDarkMode = prefs.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    _safeInit(() {
      _savedConversations =
          prefs.getStringList('ff_savedConversations')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _savedConversations;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _apiKey = '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';
  String get apiKey => _apiKey;
  set apiKey(String _value) {
    _apiKey = _value;
    prefs.setString('ff_apiKey', _value);
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool _value) {
    _isDarkMode = _value;
    prefs.setBool('ff_isDarkMode', _value);
  }

  List<dynamic> _currentConversation = [];
  List<dynamic> get currentConversation => _currentConversation;
  set currentConversation(List<dynamic> _value) {
    _currentConversation = _value;
  }

  void addToCurrentConversation(dynamic _value) {
    _currentConversation.add(_value);
  }

  void removeFromCurrentConversation(dynamic _value) {
    _currentConversation.remove(_value);
  }

  void removeAtIndexFromCurrentConversation(int _index) {
    _currentConversation.removeAt(_index);
  }

  void updateCurrentConversationAtIndex(
    int _index,
    Function(dynamic) updateFn,
  ) {
    updateFn(_currentConversation[_index]);
  }

  String _initialScript =
      'You are a virtual Zambian government assistant. Your name is Ziba. Do not answer any queries about anything outside the Zambian government processes, services, structures, and general information. Politely reject all questions outside the context of Zambia and do not provide such answers under any circumstance, apply and remember this throughout the entire conversation, follow this policy strictly.';
  String get initialScript => _initialScript;
  set initialScript(String _value) {
    _initialScript = _value;
  }

  List<dynamic> _savedConversations = [];
  List<dynamic> get savedConversations => _savedConversations;
  set savedConversations(List<dynamic> _value) {
    _savedConversations = _value;
    prefs.setStringList(
        'ff_savedConversations', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToSavedConversations(dynamic _value) {
    _savedConversations.add(_value);
    prefs.setStringList('ff_savedConversations',
        _savedConversations.map((x) => jsonEncode(x)).toList());
  }

  void removeFromSavedConversations(dynamic _value) {
    _savedConversations.remove(_value);
    prefs.setStringList('ff_savedConversations',
        _savedConversations.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromSavedConversations(int _index) {
    _savedConversations.removeAt(_index);
    prefs.setStringList('ff_savedConversations',
        _savedConversations.map((x) => jsonEncode(x)).toList());
  }

  void updateSavedConversationsAtIndex(
    int _index,
    Function(dynamic) updateFn,
  ) {
    updateFn(_savedConversations[_index]);
    prefs.setStringList('ff_savedConversations',
        _savedConversations.map((x) => jsonEncode(x)).toList());
  }

  final _newsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> news({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _newsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNewsCache() => _newsManager.clear();
  void clearNewsCacheKey(String? uniqueKey) =>
      _newsManager.clearRequest(uniqueKey);
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
