import 'package:rent_car_architecture/presentation/bloc/car_event.dart';
import 'package:rent_car_architecture/presentation/bloc/car_state.dart';

class CarBloc Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarsLoading()){
    on<LoadCars>((event, emit)) asych {
      emit(CarsLoading());
      try{
        final cars = await getCars();
        emit(CarsLoaded(cars));
      }catch(e){
        emit(CarsError(e.toString()));
      }
    }
  }
};