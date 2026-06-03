import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_flow/data/model/weather_display_details.dart';
import 'package:meteo_flow/features/location/presentation/location_provider.dart';
import 'package:meteo_flow/presentation/extensions/date_time.dart';
import 'package:meteo_flow/presentation/extensions/double.dart';
import 'package:meteo_flow/presentation/providers/weather_notifier.dart';
import 'package:meteo_flow/presentation/widgets/hourly_weather_widget.dart';

class HomeScreen
    extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    // Watches the provider. It automatically handles the background lifecycle fetch!
    final weatherState = ref.watch(
      weatherProvider,
    );

    final currentCity = ref.watch(
      currentCityProvider,
    );

    return weatherState.when(
      data: (data) {
        return SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.all(
                  24.0,
                ),
            child: Column(
              children: [
                currentCity.when(
                  data: (cityName) => Text(
                    cityName,
                    style:
                        const TextStyle(
                          fontWeight:
                              FontWeight
                                  .bold,
                          fontSize:
                              32.0,
                          color: Colors
                              .white,
                        ),
                  ),
                  loading: () =>
                      const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors
                              .white,
                          strokeWidth:
                              2,
                        ),
                      ),
                  error: (err, stack) =>
                      Text(
                        err.toString(),
                        style: TextStyle(
                          color: Colors
                              .red[300],
                          fontSize: 14,
                        ),
                      ),
                ),

                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Current time: ${DateTime.now().time}',
                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(
                  height: 40.0,
                ),
                Image.asset(
                  data
                      .current
                      .weatherCode
                      .image,
                  height: 250,
                  width: 250,
                ),
                const SizedBox(
                  height: 18.0,
                ),

                Text(
                  data
                      .current
                      .weatherCode
                      .description,
                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceEvenly,
                  children: [
                    Image.asset(
                      width: 24,
                      height: 24,
                      'assets/images/thermometer.png',
                      color:
                          Colors.white,
                    ),
                    Text(
                      '${data.current.temperature} °C',
                      style: TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                        color: Colors
                            .white,
                      ),
                    ),

                    const SizedBox(
                      width: 40.0,
                    ),

                    Image.asset(
                      width: 24,
                      height: 24,
                      'assets/images/wind.png',
                      color:
                          Colors.white,
                    ),

                    Text(
                      '${data.current.wind.kmh} km/h',
                      style: TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                        color: Colors
                            .white,
                      ),
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    Image.asset(
                      width: 24,
                      height: 24,
                      'assets/images/humidity.png',
                      color:
                          Colors.white,
                    ),
                    Text(
                      '${data.current.humidity} %',
                      style: TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                        color: Colors
                            .white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 60.0,
                ),

                const Text(
                  '24-Hour Forecast',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  textAlign:
                      TextAlign.start,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection:
                        Axis.horizontal,
                    itemCount: math.min(
                      24,
                      data
                          .hourly
                          .temperature
                          .length,
                    ),
                    itemBuilder: (context, index) {
                      final hourData = data
                          .hourly
                          .time[index];

                      final tempData = data
                          .hourly
                          .temperature[index];

                      final weatherCode =
                          data
                              .hourly
                              .weatherCode[index];

                      final hourlyDisplay =
                          WeatherDisplayDetails.mapWeatherCode(
                            weatherCode,
                          );

                      final displayTime =
                          hourData
                              .contains(
                                'T',
                              )
                          ? hourData
                                .split(
                                  'T',
                                )[1]
                          : hourData;

                      return HourlyWeatherWidget(
                        time:
                            displayTime,
                        iconPath:
                            hourlyDisplay
                                .image,
                        temp:
                            '${tempData.toStringAsFixed(0)}°C',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      // Displayed automatically while the network call is processing
      loading: () => const Center(
        child:
            CircularProgressIndicator(),
      ),
      // Displayed automatically if the network call or parsing fails
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Text(
            'Error: ${error.toString()}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
