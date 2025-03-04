# rent_car_architecture

A Flutter project for premium car rentals.

## Overview

This application provides a platform for renting premium and prestige cars at competitive prices. Users can choose from a variety of high-end vehicles, such as the Fortuner GR, and enjoy features like diesel engines, advanced acceleration, and temperature control. The app is designed to offer a seamless and luxurious car rental experience, with a focus on user convenience and advanced features.

![Premium Cars](assets/landingpage.png)
<br/>
*Image 1: The landing page of the application, showcasing premium car rental services.*

## Features

- **Car Selection**: Choose from a range of premium cars like the Fortuner GR. The app provides detailed information about each car, including fuel efficiency and rental rates.
  
  ![Car Selection](assets/list_screen_car.png)
  <br/>
  *Image 2: The car selection screen, displaying available cars and their specifications.*

- **Detailed Information**: View comprehensive details about each car, including mileage, fuel capacity, and rental rates. Users can also see different variants of the same model.

  ![Detailed Information](assets/details.car.png)
  <br/>
  *Image 3: The detailed information screen, showing specific details about a selected car.*

- **User Profiles**: Manage rentals with user-specific information. The app allows users to track their rentals and view their rental history.
  
- **Location-Based Services**: Explore available cars in various locations like Barnsbury, Islington, and Shoreditch. The app integrates with maps to show car availability in different areas.

  ![Location-Based Services](assets/mapDetails.png)
<br/>
  *Image 4: The map view, displaying car availability in different locations.*

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Dependencies and Example Code

This project uses the following dependencies to provide its functionality:

```yaml
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8

  # Firebase dependencies for backend services
  firebase_core: ^3.12.0
  cloud_firestore: ^5.6.4

  # Map-related dependencies for location-based services
  flutter_map: ^7.0.2
  latlong2: ^0.9.1

  # State management using BLoC
  bloc: ^9.0.0
  flutter_bloc: ^9.1.0

  # Dependency injection
  get_it: ^8.0.3
```

### Example Code

Below is an example of how car data is structured in the application:

```dart
class Car {
  final String model;
  final double mileage;
  final double fuelCapacity;
  final double ratePerHour;

  Car({required this.model, required this.mileage, required this.fuelCapacity, required this.ratePerHour});
}

List<Car> cars = [
  Car(model: 'Fortuner GR', mileage: 870, fuelCapacity: 50, ratePerHour: 45.00),
  // Add more cars as needed
];
```

