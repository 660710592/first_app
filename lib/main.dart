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
      //appBar: AppBar(
      //title: Text('Introduce_Myself'),
      //centerTitle: true,
      //backgroundColor: Colors.blueGrey,
      //),
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 550,
                height: 1100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 500,
                height: 1000,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: 250,
                  height: 250,
                  child: ClipOval(
                    child: Image.asset(
                      "9e49385d-e0a8-4b92-a130-9931e35dfea4.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 330),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ไชยภัทร ทาโทน',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '660710592',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'วิทยาการคอมพิวเตอร์',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'เป็นคนอารมณ์ร้อนง่าย โกรธง่ายแต่ก็หายเร็ว',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'เป็นขี้เกียจต้องใกล้วันส่งเท่านั้นถึงจะรีบขยัน',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 580,
              left: 600,
              child: Icon(Icons.facebook, size: 80, color: Colors.white),
            ),
            Positioned(
              top: 580,
              left: 720,
              child: Image.network(
                'https://static.vecteezy.com/system/resources/previews/023/986/611/non_2x/line-app-logo-line-app-logo-transparent-line-app-icon-transparent-free-free-png.png',
                width: 90,
                height: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
