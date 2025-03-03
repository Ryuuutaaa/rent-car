import 'package:rent_car_architecture/domain/repositories/car_repository.dart';
import 'package:rent_car_architecture/presentation/bloc/car_event.dart';
import 'package:rent_car_architecture/presentation/bloc/car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_car_architecture/domain/usecases/get_cars.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final CarRepository repository;

  CarBloc({required this.repository}) : super(CarsLoading()) {
    on<LoadCars>(_onLoadCars);
    on<AddSampleCars>(_onAddSampleCars);
  }

  Future<void> _onLoadCars(LoadCars event, Emitter<CarState> emit) async {
    emit(CarsLoading());
    try {
      final cars = await repository.fetchCars();
      emit(CarsLoaded(cars));
    } catch (e) {
      emit(CarsError(e.toString()));
    }
  }

  Future<void> _onAddSampleCars(AddSampleCars event, Emitter<CarState> emit) async {
    try {
      await repository.addSampleCars();
      add(LoadCars());
    } catch (e) {
      emit(CarsError(e.toString()));
    }
  }
}
