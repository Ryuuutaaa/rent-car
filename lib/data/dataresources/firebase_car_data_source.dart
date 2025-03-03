import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_car_architecture/data/models/car.dart';

class FirebaseCarDataSource {
  final FirebaseFirestore firestore;

  FirebaseCarDataSource(this.firestore);

  Future<List<Car>> getCars() async {
    final snapshot = await firestore.collection('cars').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Car.fromMap(data);
    }).toList();
  }

  Future<void> addSampleCars(List<Car> cars) async {
    final carsCollection = firestore.collection('cars');

    // Check if collection is empty before adding sample data
    final snapshot = await carsCollection.get();
    if (snapshot.docs.isNotEmpty) {
      print('Sample cars already exist');
      return;
    }

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
}
