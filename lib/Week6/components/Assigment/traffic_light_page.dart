import 'package:flutter/material.dart';
import 'package:first_app/Week6/components/Assigment/traffic_light.dart';

class TrafficLightPage extends StatefulWidget {
  const TrafficLightPage({super.key});

  @override
  State<TrafficLightPage> createState() => _TrafficLightPageState();
}

class _TrafficLightPageState extends State<TrafficLightPage> {
  int currentLight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Traffic Light"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TrafficLight(currentLight: currentLight),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentLight = (currentLight + 1) % 3;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text(
                "Change light",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
