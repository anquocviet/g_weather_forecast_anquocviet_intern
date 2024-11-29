import 'package:flutter/material.dart';
import 'package:g_weather_forecast_anquocviet_intern/models/location_model.dart';
import 'package:g_weather_forecast_anquocviet_intern/repositories/local_location_repository.dart';
import 'package:g_weather_forecast_anquocviet_intern/repositories/location_repository.dart';

class LocationViewModel extends ChangeNotifier {
  final LocationRepository _locationRepository = LocationRepository();
  final LocalLocationRepository _localLocationRepository =
      LocalLocationRepository();
  final List<LocationModel> _locations = [];
  final List<LocationModel> _historyLocations = [];
  bool _isLoading = false;

  List<LocationModel> get locations => _locations;
  List<LocationModel> get historyLocations => _historyLocations;
  bool get isLoading => _isLoading;

  Future<void> fetchLocation(String location) async {
    _isLoading = true;
    notifyListeners();
    final result = await _locationRepository.fetchLocation(location);
    _locations.clear();
    _locations.addAll(result);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveHistoryLocation(LocationModel locationModel) async {
    if (historyLocations.isEmpty || !historyLocations.any((h) => h.id == locationModel.id)) {
      historyLocations.insert(0, locationModel);
      await _localLocationRepository.saveHistoryLocation(locationModel);
      notifyListeners();
    }
  }

  Future<void> getHistoryLocation() async {
    final result = await _localLocationRepository.getHistoryLocation();
    _historyLocations.clear();
    _historyLocations.addAll(result);
    notifyListeners();
  }
}
