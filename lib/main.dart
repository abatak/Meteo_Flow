import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_flow/presentation/widgets/weather_widgets.dart';
import 'package:riverpod/src/framework.dart';
import 'package:sqflite/sqflite.dart';

// Import the database provider file that uses modern code generation
import 'package:meteo_flow/data/database/local_database_provider.dart';

void main() async {
  //* Everything which is not apart of Dart language and is external
  //* we need to call this line (e.g Firebase,database,Serverpod, internet connection...)
  //* 'WidgetsFlutterBinding.ensureInitialized()' is bridge between Dart and NativeOS
  WidgetsFlutterBinding.ensureInitialized();

  // Create a temporary container just to read the async configuration
  final container = ProviderContainer();

  // Await the database initialization future before the UI boots up
  final Database sqlDatabase =
      await container.read(
        sqlDatabaseProvider.future,
      );

  container.dispose();

  runApp(
    ProviderScope(
      overrides: [
        //  Inject the live SQLite instance into your synchronous database provider
        databaseProvider
            .overrideWithValue(
              sqlDatabase,
            ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title =
      'Meteo Flow';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.from(
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: Colors.teal,
            ),
      ),
      home: const BottomNavbarWidget(),
    );
  }
}
