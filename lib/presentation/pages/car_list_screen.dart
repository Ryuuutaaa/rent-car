import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_car_architecture/presentation/bloc/car_bloc.dart';
import 'package:rent_car_architecture/presentation/bloc/car_state.dart';
import 'package:rent_car_architecture/presentation/widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                return CarCard(
                  car: state.cars[index],
                );
              },
            );
          } else if (state is CarsError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return Container();
        },
      ),
    );
  }
}
