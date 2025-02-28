import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Tambahkan ini

class MapsDetailsPage extends StatelessWidget {
  const MapsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Maps Detail"),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(51.5, -0.09), // Gunakan initialCenter
          initialZoom: 13.0, // Gunakan initialZoom
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: [
              'a',
              'b',
              'c'
            ],
          ),
        ],
      ),
    );
  }
}
