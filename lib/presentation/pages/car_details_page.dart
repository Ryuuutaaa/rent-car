import 'package:flutter/material.dart';
import 'package:rent_car_architecture/data/models/Car.dart';
import 'package:rent_car_architecture/presentation/widgets/car_card.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text(" Informatin"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarCard(
              car: Car(model: "Fortuner GR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/user.png'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Jane Cooper',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$4,253',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/maps.png'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  const BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
