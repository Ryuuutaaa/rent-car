// lib/presentation/pages/car_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_car_architecture/presentation/bloc/car_bloc.dart';
import 'package:rent_car_architecture/presentation/bloc/car_state.dart';
import 'package:rent_car_architecture/presentation/bloc/car_event.dart';
import 'package:rent_car_architecture/presentation/widgets/car_card.dart';
import 'package:rent_car_architecture/data/models/car.dart';

class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          // Add button to load sample data
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.read<CarBloc>().add(AddSampleCars());
            },
            tooltip: 'Add sample cars',
          ),
        ],
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CarsLoaded) {
            if (state.cars.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("No cars available"),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CarBloc>().add(AddSampleCars());
                      },
                      child: const Text("Add Sample Cars"),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                return CarCard(
                  car: state.cars[index],
                );
              },
            );
          } else if (state is CarsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Error: ${state.message}"),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CarBloc>().add(LoadCars());
                    },
                    child: const Text("Try Again"),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
