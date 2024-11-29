import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../view_models/weather_view_model.dart';

class ForecastList extends StatefulWidget {
  const ForecastList({super.key});

  @override
  State<ForecastList> createState() => _ForecastListState();
}

class _ForecastListState extends State<ForecastList> {
  @override
  Widget build(BuildContext context) {
    final weatherVM = Provider.of<WeatherViewModel>(context);

    return Builder(
      builder: (context) {
        if (weatherVM.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SizedBox(
          height: 200,
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: weatherVM.forecast.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (BuildContext context, int index) {
              final forecast = weatherVM.forecast[index];
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF6C757D),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    fontFamily: GoogleFonts.rubik().fontFamily,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "(${forecast.localtime.split(" ")[0]})",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Image(
                        height: 50,
                        image: NetworkImage(
                          forecast.weatherIcon,
                        ),
                      ),
                      Text("Temperature: ${forecast.temperature} °C"),
                      Text("Wind: ${forecast.wind} M/S"),
                      Text("Humidity: ${forecast.humidity}%"),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    );
  }
}
