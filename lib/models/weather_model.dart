import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required String location,
    required String localtime,
    required String temperature,
    required String wind,
    required String humidity,
    required String weather,
    required String weatherIcon,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['location']['name'] as String, // Lấy tên location
      localtime: json['location']['localtime'], // Lấy thời gian local
      temperature: json['current']['temp_c'].toString(), // Lấy nhiệt độ celsius
      wind: json['current']['wind_mph'].toString(), // Lấy tốc độ gió
      humidity: json['current']['humidity'].toString(), // Lấy độ ẩm
      weather: json['current']['condition']['text'] as String, // Lấy điều kiện thời tiết
      weatherIcon: json['current']['condition']['icon'] as String, // Lấy URL icon
    );
  }
}
