import 'package:rent_car_architecture/data/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}
