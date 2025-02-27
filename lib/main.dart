import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rent_car_architecture/presentation/pages/car_details_page.dart';
import 'package:rent_car_architecture/presentation/pages/car_list_screen.dart';
import 'package:rent_car_architecture/presentation/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  void _incrementCounter() {
    final user = {
      "firstName": "Ryuta",
      "lastName": "Hirarito",
      "born": 2000
    };

    db.collection("users").add(user).then(
          (DocumentReference doc) => print("User added with ID: ${doc.id}"),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnboardingPage(),
    );
  }
}
