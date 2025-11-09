import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  Future<Position> getPosition() async {
    // Check if location service is enabled
    await Geolocator.isLocationServiceEnabled();
    // Add delay for showing loading animation
    await Future.delayed(const Duration(seconds: 3));
    // Get current position
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location – Agna')),
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            // While waiting for data
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            // When future is done
            else if (snapshot.connectionState == ConnectionState.done) {
              // Handle possible errors
              if (snapshot.hasError) {
                return const Text(
                  'Something terrible happened!',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                  textAlign: TextAlign.center,
                );
              }

              // If success, show the coordinates
              if (snapshot.hasData) {
                return Text(
                  'Latitude: ${snapshot.data!.latitude}\nLongitude: ${snapshot.data!.longitude}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                );
              }
            }

            // Default state
            return const Text('');
          },
        ),
      ),
    );
  }
}
