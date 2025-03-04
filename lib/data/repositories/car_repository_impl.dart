import 'package:rent_car_architecture/data/dataresources/firebase_car_data_source.dart';
import 'package:rent_car_architecture/data/models/Car.dart';
import 'package:rent_car_architecture/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}
