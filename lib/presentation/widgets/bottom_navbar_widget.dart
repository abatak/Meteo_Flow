import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_flow/presentation/providers/bottom_nav_notifier.dart';
import 'package:meteo_flow/presentation/screens/forecast_screen.dart';
import 'package:meteo_flow/presentation/screens/home_screen.dart';
import 'package:meteo_flow/presentation/screens/search_screen.dart';

class BottomNavbarWidget
    extends ConsumerWidget {
  const BottomNavbarWidget({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    ForecastScreen(),
  ];

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final activeIndex = ref.watch(
      bottomNavProvider,
    );

    return Scaffold(
      extendBody: true,

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D47A1),
              Color(0xFF1E88E5),
              Color(0xFF64B5F6),
            ],
          ),
        ),

        child: IndexedStack(
          index: activeIndex,
          children: _screens,
        ),
      ),

      bottomNavigationBar:
          BottomNavigationBar(
            backgroundColor:
                Colors.transparent,
            elevation: 0,
            currentIndex: activeIndex,
            onTap: (index) {
              ref
                  .read(
                    bottomNavProvider
                        .notifier,
                  )
                  .setIndex(index);
            },

            selectedItemColor:
                Colors.white,
            unselectedItemColor:
                Colors.white,
            type:
                BottomNavigationBarType
                    .fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Search',
              ),
            ],
          ),
    );
  }
}
