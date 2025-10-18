import 'package:flutter/material.dart';

class TrafficLight extends StatelessWidget {
  final int currentLight;
  const TrafficLight({super.key, required this.currentLight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          AnimatedOpacity(
            opacity: currentLight == 0 ? 1.0 : 0.3,
            duration: Duration(seconds: 2),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 20),
          AnimatedOpacity(
            opacity: currentLight == 1 ? 1.0 : 0.3,
            duration: Duration(seconds: 2),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 20),
          AnimatedOpacity(
            opacity: currentLight == 2 ? 1.0 : 0.3,
            duration: Duration(seconds: 2),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
