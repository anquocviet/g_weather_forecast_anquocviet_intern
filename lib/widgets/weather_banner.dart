import 'package:flutter/material.dart';
import 'package:g_weather_forecast_anquocviet_intern/view_models/weather_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WeatherBanner extends StatefulWidget {
  const WeatherBanner({super.key});

  @override
  State<WeatherBanner> createState() => _WeatherBannerState();
}

class _WeatherBannerState extends State<WeatherBanner> {
  @override
  Widget build(BuildContext context) {
    final weatherVM = Provider.of<WeatherViewModel>(context);
    final weather = weatherVM.weather;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              fontFamily: GoogleFonts.rubik().fontFamily,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${weather.location} (${weather.localtime.split(" ")[0]})',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12),
                Text("Temperature: ${weather.temperature} °C"),
                const SizedBox(height: 8),
                Text("Wind: ${weather.wind} M/S"),
                const SizedBox(height: 8),
                Text("Humidity: ${weather.humidity}%"),
              ],
            ),
          ),
          Column(
            children: [
              Image(
                image: NetworkImage(
                  weather.weatherIcon,
                ),
              ),
              Text(
                weather.weather,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
