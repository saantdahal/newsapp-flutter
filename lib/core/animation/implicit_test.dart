import 'package:flutter/material.dart';

class ImplicitTest extends StatefulWidget {
  ImplicitTest({super.key});

  @override
  _ImplicitTestState createState() => _ImplicitTestState();
}

class _ImplicitTestState extends State<ImplicitTest> {
  double height = 100;
  EdgeInsets padding = const EdgeInsets.all(20);

  void increaseHeight(double size) {
    padding = const EdgeInsets.all(10);
    height = size;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            AnimatedPadding(
              duration: Duration(seconds: 3),
              padding: padding, // Use the padding variable here
              child: AnimatedContainer(
                duration: Duration(seconds: 3),
                height: height, // Use the height variable here
                width: 200,
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
