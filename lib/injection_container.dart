import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:rent_car_architecture/data/dataresources/firebase_car_data_source.dart';
import 'package:rent_car_architecture/data/repositories/car_repository_impl.dart';
import 'package:rent_car_architecture/domain/repositories/car_repository.dart';
import 'package:rent_car_architecture/presentation/bloc/car_bloc.dart';

final getIt = GetIt.instance;

void initInjection() {
  // External dependencies
  final firestore = FirebaseFirestore.instance;
  getIt.registerLazySingleton(() => firestore);

  // Data sources
  getIt.registerLazySingleton(() => FirebaseCarDataSource(getIt<FirebaseFirestore>()));

  // Repositories
  getIt.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(getIt<FirebaseCarDataSource>()));

  // Blocs
  getIt.registerFactory(() => CarBloc(repository: getIt<CarRepository>()));
}
