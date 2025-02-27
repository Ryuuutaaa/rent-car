import 'package:flutter/material.dart';
import 'package:rent_car_architecture/data/models/Car.dart';

class MoreCard extends StatelessWidget {
  final Car car;

  const MoreCard({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff212020),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.model,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.directions_car,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "> ${car.distance} km",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.battery_full,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      car.fuelCapacity.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 24,
          ),
        ],
      ),
    );
  }
}
