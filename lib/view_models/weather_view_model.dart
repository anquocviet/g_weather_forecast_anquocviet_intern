import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/widgets.dart';
import 'package:g_weather_forecast_anquocviet_intern/models/weather_model.dart';
import 'package:g_weather_forecast_anquocviet_intern/repositories/weather_repository.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository _weatherRepository = WeatherRepository();

  WeatherModel _weather = const WeatherModel(
      location: '',
      temperature: '',
      wind: '',
      humidity: '',
      weather: '',
      weatherIcon: 'https://cdn.weatherapi.com/weather/64x64/day/113.png',
      localtime: '');
  final List<WeatherModel> _forecast = [];

  WeatherModel get weather => _weather;

  List<WeatherModel> get forecast => _forecast;

  Future<void> fetchWeather({String? location}) async {
    if (location == null) {
      final ip = await Ipify.ipv4();
      _weather = await _weatherRepository.fetchWeather(ip);
      notifyListeners();
      return;
    }
    _weather = await _weatherRepository.fetchWeather(location);
    notifyListeners();
  }

  Future<void> forecastWeather({String? location, required int days}) async {
    _forecast.clear();
    if (location == null) {
      final ip = await Ipify.ipv4();
      final forecast = await _weatherRepository.forecastWeather(ip, days + 1);
      _forecast.addAll(forecast);
      notifyListeners();
      return;
    }
    final forecast =
        await _weatherRepository.forecastWeather(location, days + 1);
    _forecast.addAll(forecast);
    notifyListeners();
  }
}
