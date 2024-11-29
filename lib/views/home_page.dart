import 'dart:async';

import 'package:flutter/material.dart';
import 'package:g_weather_forecast_anquocviet_intern/view_models/location_view_model.dart';
import 'package:g_weather_forecast_anquocviet_intern/view_models/weather_view_model.dart';
import 'package:g_weather_forecast_anquocviet_intern/widgets/daily_weather.dart';
import 'package:g_weather_forecast_anquocviet_intern/widgets/forecast_list.dart';
import 'package:g_weather_forecast_anquocviet_intern/widgets/history_location.dart';
import 'package:g_weather_forecast_anquocviet_intern/widgets/weather_banner.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final SearchController _searchController = SearchController();
  Timer? _debounce;
  int _forecastDays = 4;

  @override
  void initState() {
    final weatherVM = Provider.of<WeatherViewModel>(context, listen: false);
    final locationVM = Provider.of<LocationViewModel>(context, listen: false);
    weatherVM.fetchWeather();
    weatherVM.forecastWeather(days: _forecastDays);
    locationVM.getHistoryLocation();
    super.initState();
  }

  void _onSearchChanged(String query, LocationViewModel locationVM) {
    if (query.isEmpty) {
      return;
    }
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      await locationVM.fetchLocation(query);
      rebuildSuggestions();
    });
  }

  void _onFetchWeather(WeatherViewModel weatherVM) {
    if (_controller.text.isEmpty) {
      return;
    }
    weatherVM.fetchWeather(location: _controller.text);
    _onFetchForecast(_controller.text, weatherVM);
  }

  void _onFetchWeatherCurrentLocation(WeatherViewModel weatherVM) {
    weatherVM.fetchWeather();
    weatherVM.forecastWeather(days: _forecastDays);
  }

  void _onFetchForecast(String location, WeatherViewModel weatherVM) {
    weatherVM.forecastWeather(location: location, days: _forecastDays);
  }

  void _onViewMoreForecast(WeatherViewModel weatherVM) {
    setState(() {
      _forecastDays += 4;
    });
    if (_controller.text.isEmpty) {
      weatherVM.forecastWeather(days: _forecastDays);
    } else {
      _onFetchForecast(_controller.text, weatherVM);
    }
  }

  void _onSaveHistory(LocationViewModel locationVM) {
    if (_controller.text.isEmpty) {
      return;
    }
    locationVM.saveHistoryLocation(locationVM.locations.first);
  }

  void rebuildSuggestions() {
    final previousText = _searchController.text;
    _searchController.text = '';
    _searchController.text = previousText;
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 700;
    final locationVM = Provider.of<LocationViewModel>(context);
    final weatherVM = Provider.of<WeatherViewModel>(context);
    final locations = locationVM.locations;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Weather Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: isMobile ? const EdgeInsets.all(16) : const EdgeInsets.all(40),
        color: const Color(0xFFE3F3FD),
        child: Center(
          child: Builder(builder: (context) {
            final flex = Flex(
              direction: width > 700 ? Axis.horizontal : Axis.vertical,
              children: [
                Builder(builder: (context) {
                  final column = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DailyWeather(),
                      const SizedBox(height: 16),
                      const Text(
                        "Enter a City Name",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SearchAnchor(
                        searchController: _searchController,
                        builder: (BuildContext context,
                            SearchController controller) {
                          return SearchBar(
                            hintText: "Eg., New York, London, Tokyo",
                            constraints: const BoxConstraints(
                              maxHeight: 45,
                              minHeight: 45,
                            ),
                            padding: const WidgetStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 8)),
                            shadowColor:
                                const WidgetStatePropertyAll(Colors.white),
                            backgroundColor:
                                const WidgetStatePropertyAll(Colors.white),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            controller: _controller,
                            onTap: () {
                              controller.openView();
                            },
                          );
                        },
                        viewOnChanged: (value) {
                          _onSearchChanged(value, locationVM);
                        },
                        suggestionsBuilder: (BuildContext context,
                            SearchController controller) {
                          return locations.map((location) {
                            return ListTile(
                              title: Text(location.name),
                              onTap: () {
                                _controller.text = location.name;
                                _onFetchWeather(weatherVM);
                                _onSaveHistory(locationVM);
                                setState(() {
                                  controller.closeView(location.name);
                                });
                              },
                            );
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {
                            _onFetchWeather(weatherVM);
                            _onSaveHistory(locationVM);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: const Text(
                            "Search",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Row(children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text("or"),
                        ),
                        Expanded(child: Divider()),
                      ]),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () =>
                              _onFetchWeatherCurrentLocation(weatherVM),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6C757D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: const Text(
                            "Use Current Location",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (!isMobile)
                        Expanded(
                          child: HistoryLocation(
                            onFetchWeather: _onFetchWeather,
                            searchController: _controller,
                          ),
                        ),
                    ],
                  );
                  if (isMobile) return column;
                  return Expanded(
                    flex: 1,
                    child: column,
                  );
                }),
                const SizedBox(width: 40),

                // Weather Forecast
                Builder(builder: (context) {
                  final column = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WeatherBanner(), // Weather Banner

                      if (isMobile)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: SizedBox(
                            height: locationVM.historyLocations.isNotEmpty
                                ? 200
                                : 0,
                            child: HistoryLocation(
                              onFetchWeather: _onFetchWeather,
                              searchController: _controller,
                            ),
                          ),
                        ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "4-Days Forecast",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const ForecastList(),
                      const SizedBox(height: 16),
                      if (weatherVM.forecast.isNotEmpty)
                        ElevatedButton(
                          onPressed: () => _onViewMoreForecast(weatherVM),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: const Text(
                            "View More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                    ],
                  );
                  if (isMobile) return column;
                  return Expanded(
                    flex: 2,
                    child: column,
                  );
                })
              ],
            );
            if (isMobile) return SingleChildScrollView(child: flex);
            return flex;
          }),
        ),
      ),
    );
  }
}
