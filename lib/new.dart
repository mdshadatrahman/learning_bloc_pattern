import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              transform: Matrix4.skewY(0.2)..rotateX(0.5),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
