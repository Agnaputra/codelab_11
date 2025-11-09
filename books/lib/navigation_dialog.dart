import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700; // Default background color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen - Agna'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }

  // Async method to show dialog and wait for selection
  Future<void> _showColorDialog(BuildContext context) async {
    final selectedColor = await showDialog<Color>(
      barrierDismissible: false, // User must select a color
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Important Question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Dark Blue'),
              onPressed: () {
                Navigator.pop(context, Colors.blue.shade900);
              },
            ),
            TextButton(
              child: const Text('Cyan'),
              onPressed: () {
                Navigator.pop(context, Colors.cyan.shade700);
              },
            ),
            TextButton(
              child: const Text('Pink'),
              onPressed: () {
                Navigator.pop(context, Colors.pink.shade400);
              },
            ),
          ],
        );
      },
    );

    // Update the background color after user selection
    if (selectedColor != null) {
      setState(() {
        color = selectedColor;
      });
    }
  }
}
