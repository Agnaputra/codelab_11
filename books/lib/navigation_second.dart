import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Second Screen - Agna')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Dark Blue'),
              onPressed: () {
                color = Colors.blue.shade900;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Cyan'),
              onPressed: () {
                color = Colors.cyan.shade700;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Pink'),
              onPressed: () {
                color = Colors.pink.shade400;
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}
