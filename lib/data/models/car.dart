class Car {
  final String id; // Add ID for Firestore document reference
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Car({
    this.id = '', // Default empty ID for new cars
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
  });

  factory Car.fromMap(Map<String, dynamic> map, {String id = ''}) {
    return Car(
      id: id,
      model: map['model'] ?? '',
      distance: (map['distance'] ?? 0).toDouble(),
      fuelCapacity: (map['fuelCapacity'] ?? 0).toDouble(),
      pricePerHour: (map['pricePerHour'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'distance': distance,
      'fuelCapacity': fuelCapacity,
      'pricePerHour': pricePerHour,
    };
  }
}
