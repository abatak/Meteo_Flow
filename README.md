# Meteo Flow

Meteo Flow is a production-ready weather application built with a focus on modern development practices, cross-platform performance, and Clean Architecture. It delivers real-time weather analytics, precise location-aware updates, and extended multi-day forecasts for global locations.

<br>
<br>

**GitHub Repository:** [Meteo Flow Repository](https://github.com/abatak/Meteo_Flow)

<br><br>

## Features

 * **Geo-Location Sensing:** Seamless integration with system native APIs to instantly track and load local city weather on app startup.
 * **Global Location Search:** Multi-parametric search interface allowing users to find, query, and cache weather statistics for any municipality worldwide.
 * **Granular 24-Hour Timeline:** A responsive horizontal scrolling forecast layout keeping tracking of immediate hourly fluctuations.
 * **Extended 7-Day Outlook:** Deep data visualization showing contextual long-range atmospheric tracking for clicked locations.
 * **Persistent Storage Caching:** Native SQL local storage to handle immediate data loading and minimize unnecessary network operations.

<br><br>

## Architecture & Design

The project is built using Clean Architecture to ensure a high degree of testability, decoupling, and code maintainability. It is structured into distinct engineering layers:

   * **Presentation:** Flutter UI widgets utilizing declarative layout principles. State tracking and background lifecycle data fetching are reactive, driven natively by Riverpod.
   * **Domain:** Pure Dart business logic layer holding data transformation schemas, entity models, and abstract repository blueprints.
   * **Data:** Implementation layer managing concrete communication frameworks via external data providers (REST API clients and local databases).

<br><br>

## Technical Stack

   * **Framework & Language:** Flutter & Dart 
   * **State Management & DI:** Flutter Riverpod (with modern build_runner code generation)
   * **Asynchronous Logic:** Futures, Async/Await concurrency structures
   * **UI Component Architecture:** Slivers (`CustomScrollView`, `SliverList`) & Adaptive `ListView` Builders
   * **Networking:** Dio Client HTTP engine
   * **Local Database:** Sqflite (Relational SQLite wrapper)
   * **Hardware Interaction:** Geolocator (Native Platform Core GPS Location Channel)
   * * **API:** Open-Meteo Weather API

<br><br>

## Testing

A robust testing environment is implemented to guarantee logic integrity across diverse operating system layers:

   * **Unit Testing:** Focused test suites validating provider state emissions, business rule models, and mock repository responses using Mocktail.
 

<br><br>

## Installation & Setup

* Clone the repository:
    ```bash
    git clone [https://github.com/abatak/Meteo_Flow.git](https://github.com/abatak/Meteo_Flow.git)
    ```

* Open the project in your preferred IDE (VS Code / Android Studio).

* Fetch the required Flutter dependencies via CLI:
    ```bash
    flutter pub get
    ```

* Run the automated code generation script to build Riverpod providers:
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

* Connect a running emulator or physical testing device, then execute the application binary:
    ```bash
    flutter run
    ```
