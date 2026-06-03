import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_flow/data/model/weather_display_details.dart';
import 'package:meteo_flow/presentation/providers/city_search_notifier.dart';
import 'package:meteo_flow/presentation/providers/city_weather_provider.dart';
import 'package:meteo_flow/presentation/screens/forecast_screen.dart';

class SearchScreen
    extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen>
  createState() => _SearchScreenState();
}

class _SearchScreenState
    extends
        ConsumerState<SearchScreen> {
  TextEditingController controller =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    controller =
        TextEditingController();
    // Initialize once, then add a listener to catch all changes
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(
      citySearchProvider,
    );

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          const Text(
            'Pick Location',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight:
                  FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            padding:
                const EdgeInsets.all(
                  12.0,
                ),
            child: const Text(
              'Find the area of city that you want to know the detailed weather info at this time',
              textAlign:
                  TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding:
                const EdgeInsets.all(
                  18.0,
                ),
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              controller: controller,
              onChanged: (value) {
                ref
                    .read(
                      citySearchProvider
                          .notifier,
                    )
                    .searchCities(
                      value,
                    );
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white70,
                ),
                suffixIcon:
                    controller
                        .text
                        .isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons
                              .cancel_outlined,
                          color: Colors
                              .white70,
                        ),
                        onPressed: () {
                          controller
                              .clear();
                          ref
                              .read(
                                citySearchProvider
                                    .notifier,
                              )
                              .searchCities(
                                '',
                              );
                        },
                      )
                    : null,
                enabledBorder:
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                      borderSide:
                          BorderSide(
                            color: Colors
                                .white,
                            width: 2,
                          ),
                    ),
                focusedBorder:
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                      borderSide:
                          BorderSide(
                            color: Colors
                                .white,
                            width: 2,
                          ),
                    ),
              ),
            ),
          ),

          Expanded(
            child: searchState.when(
              data: (cities) {
                if (cities.isEmpty) {
                  return const Center(
                    child: Text(
                      'No cities found',
                      style: TextStyle(
                        color: Colors
                            .white,
                        fontSize: 16.0,
                      ),
                    ),
                  );
                }

                // Same as LazyColumn in Jetpack Compose
                return ListView.builder(
                  itemCount:
                      cities.length,
                  itemBuilder: (context, index) {
                    final city =
                        cities[index];

                    return Consumer(
                      builder: (context, ref, child) {
                        final weatherState =
                            ref.watch(
                              cityWeatherProvider(
                                lat: city
                                    .lat,
                                lon: city
                                    .lon,
                              ),
                            );

                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal:
                                18.0,
                            vertical:
                                8.0,
                          ),
                          color: const Color(
                            0xFF0F2547,
                          ),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                                  16.0,
                                ),
                          ),

                          child: InkWell(
                            onTap: () {
                              ref
                                      .read(
                                        selectedCityProvider.notifier,
                                      )
                                      .state =
                                  city;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (
                                        context,
                                      ) => const ForecastScreen(),
                                ),
                              );
                            },

                            child: Padding(
                              padding:
                                  const EdgeInsets.all(
                                    16.0,
                                  ),
                              child: weatherState.when(
                                data:
                                    (
                                      weatherData,
                                    ) {
                                      final double
                                      temp =
                                          weatherData['temperature'] ??
                                          0.0;

                                      final WeatherDisplayDetails
                                      weatherDetails = weatherData['details'];

                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Left Side Content Info
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  city.name,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: 4.0,
                                                ),
                                                Text(
                                                  city.country ??
                                                      '',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: 4.0,
                                                ),
                                                Text(
                                                  weatherDetails.description,
                                                  style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 14.0,
                                                  ),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16.0,
                                          ),

                                          // Right Side Metrics Info
                                          Row(
                                            children: [
                                              Image.asset(
                                                weatherDetails.image,
                                                width: 42.0,
                                                height: 42.0,
                                                errorBuilder:
                                                    (
                                                      context,
                                                      error,
                                                      stackTrace,
                                                    ) {
                                                      return const Icon(
                                                        Icons.wb_cloudy,
                                                        color: Colors.white,
                                                        size: 32.0,
                                                      );
                                                    },
                                              ),
                                              const SizedBox(
                                                width: 12.0,
                                              ),
                                              Text(
                                                '${temp.toStringAsFixed(1)}°C',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                loading: () => const SizedBox(
                                  height:
                                      48.0,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.5,
                                    ),
                                  ),
                                ),
                                error:
                                    (
                                      error,
                                      stackTrace,
                                    ) => const SizedBox(
                                      height: 48.0,
                                      child: Center(
                                        child: Text(
                                          'Weather unavailable',
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              loading: () => const Center(
                child:
                    CircularProgressIndicator(
                      color:
                          Colors.white,
                    ),
              ),
              error: (error, stackTrace) => Center(
                child: Padding(
                  padding:
                      const EdgeInsets.all(
                        24.0,
                      ),
                  child: Text(
                    error.toString(),
                    textAlign: TextAlign
                        .center,
                    style:
                        const TextStyle(
                          color: Colors
                              .red,
                          fontSize:
                              16.0,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
