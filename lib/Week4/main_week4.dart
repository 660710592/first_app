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