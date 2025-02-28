import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rent_car_architecture/presentation/pages/MapsDetailsPage.dart';
import 'package:rent_car_architecture/presentation/pages/car_details_page.dart';
import 'package:rent_car_architecture/presentation/pages/car_list_screen.dart';
import 'package:rent_car_architecture/presentation/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Mapsdetailspage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
