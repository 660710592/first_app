import 'dart:convert';

import 'package:first_app/Model/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Assigment extends StatefulWidget {
  const Assigment({super.key});

  @override
  State<Assigment> createState() => _AssigmentState();
}

class _AssigmentState extends State<Assigment> {
  User? userEmployee;
  List<User> listUser = [];
  Future<void> fetchData() async {
    try {
      var response = await http.get(
        Uri.parse('http://localhost:8001/products'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        listUser = jsonList.map((item) => User.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> createProduct() async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:8001/products"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": "iPhone 5s",
          "description": "Apple smartphone",
          "price": 21999.00,
        }),
      );
      if (response.statusCode == 201) {
        //code somthing...
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProduct({dynamic idUpdate = "100"}) async {
    try {
      var response = await http.put(
        Uri.parse("http://localhost:8001/products/$idUpdate"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": "iPhone 5 plus",
          "description": "Apple smartphone",
          "price": 34900.00,
        }),
      );
      if (response.statusCode == 200) {
        //ScaffoldMessenger
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct({dynamic idDelete = "6"}) async {
    try {
      var response = await http.delete(
        Uri.parse("http://localhost:8001/products/$idDelete"),
      );
      if (response.statusCode == 200) {
        //code somthing...
      } else {
        throw Exception("Failed to delete products");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Example'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text('${listUser[index].id}'),
                  title: Text('Name : ${listUser[index].name}'),
                  trailing: Text(
                    'Description : ${listUser[index].description}',
                  ),
                  subtitle: Text('Price : ${listUser[index].price}'),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemCount: listUser.length,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    fetchData();
                  },
                  child: Text('Get'),
                ),
                ElevatedButton(
                  onPressed: () {
                    createProduct();
                  },
                  child: Text('Post'),
                ),
                ElevatedButton(
                  onPressed: () {
                    updateProduct();
                  },
                  child: Text('Put'),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteProduct();
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final int id;
  final String name;
  final String description;
  final double price;

  User(this.id, this.name, this.description, this.price) {}

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      description = json['description'],
      price = json['price'];
}
