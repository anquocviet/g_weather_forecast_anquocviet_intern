import 'dart:convert';

import 'package:g_weather_forecast_anquocviet_intern/models/location_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalLocationRepository {
  Future<List<LocationModel>> getHistoryLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split("T").first;
    final history = prefs.getString(today);
    if (history != null) {
      return json
          .decode(history)
          .map<LocationModel>((json) => LocationModel.fromJson(json))
          .toList();
    }
    return [];
  }

  Future<void> saveHistoryLocation(LocationModel location) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split("T").first;
    final history = prefs.getString(today);
    if (history != null) {
      final historyDecode = json.decode(history);
      prefs.setString(today, json.encode([...historyDecode, location]));
    } else {
      prefs.clear();
      prefs.setString(today, json.encode([location.toJson()]));
    }
  }
}
