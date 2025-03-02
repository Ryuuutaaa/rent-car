import 'package:rent_car_architecture/data/models/car.dart';
import 'package:rent_car_architecture/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}
