import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  double _size = 100;
  Color _color = Colors.red;
  double _opacity = 0.0;
  bool _isleft = false;
  double _padding = 10;
  bool _isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: _isFirst
                  ? Container(
                      key: const ValueKey(1),
                      width: 100,
                      height: 100,
                      color: Colors.orange,
                    )
                  : Container(
                      key: const ValueKey(2),
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isFirst = !_isFirst;
                });
              },
              child: const Text('Switch Widget'),
            ),
          ],
        ),
      ),
      /*body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPadding(
              padding: EdgeInsets.all(_padding),
              duration: Duration(microseconds: 500),
              child: Container(height: 100, width: 100, color: Colors.yellow),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _size = _size == 100 ? 150 : 100;
                  _color = _color == Colors.red ? Colors.blue : Colors.red;
                  _opacity = _opacity == 0 ? 1.0 : 0.0;
                  _padding = _padding == 10 ? 50 : 10;
                });
              },
              child: Text('Animation Box'),
            ),
          ],
        ),
      ),*/
      /*body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedAlign(
            alignment: _isleft ? Alignment.centerLeft : Alignment.centerRight,
            duration: Duration(milliseconds: 500),
            child: Container(height: 100, width: 100, color: Colors.red),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isleft = !_isleft;
              });
            },
            child: Text('Move Box'),
          ),
        ],
      ),*/
      /* body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              height: _size,
              width: _size,
              color: _color,
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Text("Hi cpsu", style: TextStyle(fontSize: 26)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _size = _size == 100 ? 150 : 100;
                  _color = _color == Colors.red ? Colors.blue : Colors.red;
                  _opacity = _opacity == 0 ? 1.0 : 0.0;
                });
              },
              child: Text('Animation Box'),
            ),
          ],
        ),
      ),*/
    );
  }
}
