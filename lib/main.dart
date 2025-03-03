import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_car_architecture/firebase_options.dart';
import 'package:rent_car_architecture/injection_container.dart';
import 'package:rent_car_architecture/presentation/bloc/car_bloc.dart';
import 'package:rent_car_architecture/presentation/bloc/car_event.dart';
import 'package:rent_car_architecture/presentation/pages/MapsDetailsPage.dart';
import 'package:rent_car_architecture/presentation/pages/car_details_page.dart';
import 'package:rent_car_architecture/presentation/pages/car_list_screen.dart';
import 'package:rent_car_architecture/presentation/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: OnboardingPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
