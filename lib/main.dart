import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First App', style: TextStyle(color: Colors.white)),
        centerTitle: false,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 120,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
            ),

            Positioned(
              top: 20,
              left: 20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              top: 110,
              left: 20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: 20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
      /*Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Container(height: 100, width: 100, color: Colors.red),
              SizedBox(width: 20),
              Container(height: 100, width: 100, color: Colors.green),
              SizedBox(width: 20),
              Container(height: 100, width: 100, color: Colors.blue),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Container(height: 100, color: Colors.yellow),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: Container(height: 100, color: Colors.purple),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),*/
      /*Center(
        child: Container(
          width: 250,
          height: 250,
          color: Colors.blue,
          child:
          Center(
            child: Text(
              'Hello, Chaiyaphat Thathon 660710592',
              style: TextStyle(fontSize: 30),textAlign: TextAlign.center,
            ),
          ),
        ) /*Text(
          "Hello world!",
          style: TextStyle(
            fontSize: 32,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),*/,
      ),*/
    );
  }
}
