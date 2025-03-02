import 'package:flutter/material.dart';
import 'package:rent_car_architecture/data/models/Car.dart';
import 'package:rent_car_architecture/presentation/pages/MapsDetailsPage.dart';
import 'package:rent_car_architecture/presentation/widgets/car_card.dart';
import 'package:rent_car_architecture/presentation/widgets/more_card.dart';

class CarDetailsPage extends StatefulWidget {
  final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller!)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller!.forward();
        }
      });
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.info_outline),
            Text(" Information"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarCard(car: Car(model: widget.car.model, distance: widget.car.distance, fuelCapacity: widget.car.fuelCapacity, pricePerHour: widget.car.pricePerHour)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/user.png'),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Jane Cooper',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$4,253',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        //
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapsDetailsPage(
                              car: widget.car, // Gunakan variabel car (huruf kecil), bukan Car (huruf besar)
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5,
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Transform.scale(
                            scale: _animation!.value,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/maps.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  MoreCard(car: Car(model: widget.car.model + "-1", distance: widget.car.distance + 100, fuelCapacity: widget.car.fuelCapacity + 100, pricePerHour: widget.car.pricePerHour + 10)),
                  const SizedBox(height: 5),
                  MoreCard(car: Car(model: widget.car.model + "-2", distance: widget.car.distance + 200, fuelCapacity: widget.car.fuelCapacity + 200, pricePerHour: widget.car.pricePerHour + 20)),
                  const SizedBox(height: 5),
                  MoreCard(
                    car: Car(model: widget.car.model + "-3", distance: widget.car.distance + 300, fuelCapacity: widget.car.fuelCapacity + 300, pricePerHour: widget.car.pricePerHour + 30),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
