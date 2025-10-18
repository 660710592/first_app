import 'package:flutter/material.dart';

class Customcounterwidget extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  const Customcounterwidget({
    super.key,
    required this.title,
    required this.backgroundColor,
  });

  @override
  State<Customcounterwidget> createState() => _CustomcounterwidgetState();
}

class _CustomcounterwidgetState extends State<Customcounterwidget> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Text(
          '${widget.title}: $_counter',
          style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16,),
        ElevatedButton(onPressed: _incrementCounter, child: const Text('Increment'))
      ],),
    );
  }
}
