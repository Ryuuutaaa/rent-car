import 'package:flutter/material.dart';
import 'package:rent_car_architecture/data/models/Car.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xfff3f3f3),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/car_image.png",
            height: 120,
          ),
          Text(
            car.model,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/gps.png", height: 20),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${car.distance.toStringAsFixed(0)} km',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/pump.png",
                    height: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${car.fuelCapacity.toStringAsFixed(0)} L',
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
