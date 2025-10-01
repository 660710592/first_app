import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterMyWidgetState();
}

class _CounterMyWidgetState extends State<CounterWidget> {
  int counter = 0;
  Color boxcolor = Colors.red;
  @override
  void initState() {
    setState(() {
      counter = 0;
    });
  }

  Color getColorBox() {
    if (counter % 2 == 0) {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Statefulwidget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //color: getColorBox(),
              child: Text(
                'Counter Value:',
                style: TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              '$counter',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter = counter - 1;
                    });
                  },
                  child: Text('- Decrement'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter = counter + 1;
                    });
                  },
                  child: Text('+ Increment'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter = 0;
                    });
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
