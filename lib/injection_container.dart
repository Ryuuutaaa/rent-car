import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:rent_car_architecture/data/dataresources/firebase_car_data_source.dart';
import 'package:rent_car_architecture/data/repositories/car_repository_impl.dart';
import 'package:rent_car_architecture/domain/repositories/car_repository.dart';
import 'package:rent_car_architecture/domain/usecases/get_cars.dart';
import 'package:rent_car_architecture/presentation/bloc/car_bloc.dart';

final getIt = GetIt.instance;

void initInjection() {
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  getIt.registerLazySingleton<FirebaseCarDataSource>(() => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()));

  getIt.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(getIt<FirebaseCarDataSource>()));

  getIt.registerLazySingleton<GetCars>(() => GetCars(getIt<CarRepository>()));

  getIt.registerFactory<CarBloc>(() => CarBloc(getCars: getIt<GetCars>()));
}
