// presentation/screens/forecast_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_flow/data/model/weather_display_details.dart';
import 'package:meteo_flow/presentation/providers/city_weather_provider.dart';
// Added import for your provider

class ForecastScreen
    extends ConsumerWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    // Listens to the selectedCityProvider and automatically rebuilds
    // this screen whenever the user selects a different city.
    final city = ref.watch(
      selectedCityProvider,
    );

    final weatherState = ref.watch(
      cityWeatherProvider(
        lat: city?.lat ?? 45.339428,
        lon: city?.lon ?? 18.995344,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(
        0xFF1E88E5,
      ), // Keeps your gradient wrapper background active
      appBar: AppBar(
        backgroundColor: const Color(
          0xFF1E88E5,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // Makes back arrow white
      ),
      body: SafeArea(
        child: weatherState.when(
          data: (weatherData) {
            // Extract fields based on your cityWeather provider's return structure
            final double currentTemp =
                weatherData['temperature'] ??
                0.0;
            final WeatherDisplayDetails
            currentDetails =
                weatherData['details'];
            final List<
              Map<String, dynamic>
            >
            forecastList =
                weatherData['forecast'] ??
                [];

            return CustomScrollView(
              slivers: [
                // Top Current Weather Header Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.fromLTRB(
                          16.0,
                          0.0,
                          16.0,
                          24.0,
                        ),
                    child: Column(
                      children: [
                        Text(
                          city?.name ??
                              'Vukovar',
                          style: const TextStyle(
                            color: Colors
                                .white,
                            fontSize:
                                32.0,
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Image.asset(
                          currentDetails
                              .image,
                          width: 110.0,
                          height: 110.0,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          '${currentTemp.toStringAsFixed(1)}°C',
                          style: const TextStyle(
                            color: Colors
                                .white,
                            fontSize:
                                68.0,
                            fontWeight:
                                FontWeight
                                    .w200,
                          ),
                        ),
                        Text(
                          currentDetails
                              .description,
                          style: const TextStyle(
                            color: Colors
                                .white70,
                            fontSize:
                                18.0,
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        const Align(
                          alignment:
                              Alignment
                                  .centerLeft,
                          child: Text(
                            '7-Day Forecast',
                            style: TextStyle(
                              color: Colors
                                  .white,
                              fontSize:
                                  20.0,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 7-Day Loop Forecast Display List
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal:
                            16.0,
                      ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final dayData =
                            forecastList[index];
                        final WeatherDisplayDetails
                        dayDetails =
                            dayData['details'];

                        return Card(
                          margin:
                              const EdgeInsets.symmetric(
                                vertical:
                                    6.0,
                              ),
                          color: const Color(
                            0xFF0F2547,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                                  14.0,
                                ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal:
                                  16.0,
                              vertical:
                                  14.0,
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                              children: [
                                Text(
                                  index ==
                                          0
                                      ? 'Today'
                                      : dayData['date'],
                                  style: const TextStyle(
                                    color:
                                        Colors.white,
                                    fontSize:
                                        16.0,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                                Image.asset(
                                  dayDetails
                                      .image,
                                  width:
                                      32.0,
                                  height:
                                      32.0,
                                ),
                                Text(
                                  '${dayData['temp_max'].toStringAsFixed(0)}° / ${dayData['temp_min'].toStringAsFixed(0)}°C',
                                  style: const TextStyle(
                                    color:
                                        Colors.white,
                                    fontSize:
                                        16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount:
                          forecastList
                              .length,
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(
            child:
                CircularProgressIndicator(
                  color: Colors.white,
                ),
          ),
          error: (error, _) => Center(
            child: Padding(
              padding:
                  const EdgeInsets.all(
                    16.0,
                  ),
              child: Text(
                error.toString(),
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16.0,
                ),
                textAlign:
                    TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
