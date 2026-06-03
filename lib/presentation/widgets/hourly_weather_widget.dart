import 'package:flutter/material.dart';

class HourlyWeatherWidget
    extends StatelessWidget {
  final String time;
  final String iconPath;
  final String temp;

  const HourlyWeatherWidget({
    super.key,
    required this.time,
    required this.iconPath,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(
        right: 16.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0F2547),
        borderRadius:
            BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8.0),
          Image.asset(
            iconPath,
            height: 35,
            width: 35,
          ),
          const SizedBox(height: 8.0),
          Text(
            temp,
            style: const TextStyle(
              color: Colors.white,
              fontWeight:
                  FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
