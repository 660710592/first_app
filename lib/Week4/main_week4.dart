import 'package:flutter/material.dart';

class listview_week4 extends StatelessWidget {
  const listview_week4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.red,
            child: Text('Item1'),
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.green,
            child: Text('Item2'),
          ),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.blue,
            child: Text('Item3'),
          ),
          Container(
              height: 200,
              width: double.infinity,
              color: Colors.yellow,
              child: Text('Item4'),
            ),
        ],
      ),
    );
  }
}

class listview_builder extends StatelessWidget {
  const listview_builder({super.key, required int itemCount, required ListTile Function(dynamic context, dynamic index) itemBuilder});

  @override
  Widget build(BuildContext context) {
    List<String> listproduct = ['Apple', 'Samsung', 'Oppo', 'Blackbarry'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: listproduct.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('$index'),
            title: Text(listproduct[index]),
            subtitle: Text('loremlore....'),
            trailing: Icon(Icons.edit),
          );
          /*Container(
            height: 400,
            width: double.infinity,
            color: Colors.red,
            child: Text('Item ${listproduct[index]}'),
          );*/
        },
      ),
    );
  }
}

class Assignment extends StatelessWidget {
  const Assignment({super.key});

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
                child: SizedBox(
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