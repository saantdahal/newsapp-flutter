import 'package:flutter/material.dart';

class ImplicitTest extends StatefulWidget {
  ImplicitTest({super.key});

  @override
  _ImplicitTestState createState() => _ImplicitTestState();
}

class _ImplicitTestState extends State<ImplicitTest> {
  double height = 300; // Initial height
  EdgeInsets padding = const EdgeInsets.all(20); // Initial padding

  // Function to increase the height and change padding
  void increaseHeight(double size) {
    padding = const EdgeInsets.all(10); // Change padding
    height = size; // Update height
    setState(() {}); // Trigger a rebuild
  }

  // Function to decrease the height and change padding
  void decreaseHeight(double size) {
    padding = const EdgeInsets.all(20); // Reset padding to default
    height = size; // Update height
    setState(() {}); // Trigger a rebuild
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animation Demo"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center content vertically
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Implicit animation for padding and container height
                AnimatedPadding(
                  duration: const Duration(
                      seconds: 2), // Set duration for padding animation
                  padding: padding, // Animated padding based on the state
                  child: AnimatedContainer(
                    duration: const Duration(
                        seconds: 2), // Set duration for container animation
                    curve: Curves
                        .easeInOut, // Animation curve for smooth transitions
                    height: height, // Animated height based on the state
                    width: 200, // Static width
                    decoration: BoxDecoration(
                      color: Colors
                          .blueAccent, // Container color set in decoration
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                    height: 30), // Space between container and buttons

                // Button to trigger the height increase
                ElevatedButton(
                  onPressed: () =>
                      increaseHeight(200), // Change height to 200 when pressed
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .deepPurple, // Button color (use backgroundColor instead of primary)
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Increase Height",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 15), // Space between buttons

                // Button to trigger the height decrease
                ElevatedButton(
                  onPressed: () =>
                      decreaseHeight(100), // Change height to 100 when pressed
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .redAccent, // Button color (use backgroundColor instead of primary)
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Decrease Height",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
