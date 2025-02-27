import 'package:flutter/material.dart';
import 'package:rent_car_architecture/data/models/Car.dart';
import 'package:rent_car_architecture/presentation/widgets/car_card.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text(" Informatin"),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            car: Car(model: "Fortuner GR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffF3F3F3),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
              ],
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/user.ong'),
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
        ],
      ),
    );
  }
}
