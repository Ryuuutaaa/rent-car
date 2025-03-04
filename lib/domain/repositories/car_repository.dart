import 'package:rent_car_architecture/data/models/Car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}
