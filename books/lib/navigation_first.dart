import 'package:flutter/material.dart';
import 'navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = Colors.indigo.shade700; // Favorite theme color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation First Screen - Agna'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context);
          },
        ),
      ),
    );
  }

  Future<void> _navigateAndGetColor(BuildContext context) async {
    // Wait for color result from second screen
    final newColor = await Navigator.push<Color>(
      context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()),
    );

    // If null, keep old color
    if (newColor != null) {
      setState(() {
        color = newColor;
      });
    }
  }
}
