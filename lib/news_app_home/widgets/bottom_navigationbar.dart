import 'package:flutter/material.dart';

class ButtomNavigationBarWidgets extends StatelessWidget {
  const ButtomNavigationBarWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
