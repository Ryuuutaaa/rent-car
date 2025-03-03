import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_car_architecture/data/dataresources/firebase_car_data_source.dart';
import 'package:rent_car_architecture/data/models/car.dart';
import 'package:rent_car_architecture/domain/repositories/car_repository.dart';

class CarRepositoryImpl {
  final FirebaseFirestore firestore;

  CarRepositoryImpl({required this.firestore});

  // Method to add sample cars to Firestore
  Future<void> addSampleCars() async {
    final carsCollection = firestore.collection('cars');

    // Check if collection is empty before adding sample data
    final snapshot = await carsCollection.get();
    if (snapshot.docs.isNotEmpty) {
      print('Sample cars already exist');
      return;
    }

    final List<Car> cars = [
      Car(model: "Fortuner GR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
      Car(model: "Fortuner GR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
      Car(model: "Fortuner GR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
    ];

    // Add each car to Firestore
    for (var car in cars) {
      await carsCollection.add({
        'model': car.model,
        'distance': car.distance,
        'fuelCapacity': car.fuelCapacity,
        'pricePerHour': car.pricePerHour,
      });
    }

    print('Sample cars added to Firestore');
  }

  // Method to get all cars from Firestore
  Future<List<Car>> getCars() async {
    final carsCollection = firestore.collection('cars');
    final snapshot = await carsCollection.get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Car.fromMap(data);
    }).toList();
  }
}
