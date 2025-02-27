import 'package:flutter/material.dart';
import 'package:rent_car_architecture/data/models/Car.dart';
import 'package:rent_car_architecture/presentation/widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key}) : super(key: key);
  final List<Car> cars = [
    Car(model: "Fortuner GR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: "Fortuner GR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
    Car(model: "Fortuner GR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(
            car: cars[index],
          );
        },
      ),
    );
  }
}
