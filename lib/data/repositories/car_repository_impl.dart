import 'package:rent_car_architecture/data/dataresources/firebase_car_data_source.dart';
import 'package:rent_car_architecture/data/models/car.dart';
import 'package:rent_car_architecture/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }

  @override
  Future<void> addSampleCars() async {
    final List<Car> cars = [
      Car(model: "Fortuner GR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
      Car(model: "Fortuner GR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
      Car(model: "Fortuner GR", distance: 870, fuelCapacity: 50, pricePerHour: 45),
    ];

    await dataSource.addSampleCars(cars);
  }
}
