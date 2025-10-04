import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiExampleList extends StatefulWidget {
  const ApiExampleList({super.key});

  @override
  State<ApiExampleList> createState() => _ApiExampleListState();
}

class _ApiExampleListState extends State<ApiExampleList> {
  UserEmployee? userEmployee;
  List<UserEmployee> listEmployee = [];

  void fetchUser() async {
    try {
      var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users/'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          listEmployee = jsonList
              .map((item) => UserEmployee.fromJson(item))
              .toList();
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ApiExampleList'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          ElevatedButton(
            onPressed: () {
              fetchUser();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),

      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text('${listEmployee[index].id}'),
            title: Text('Name : ${listEmployee[index].name}'),
            trailing: Text('Email : ${listEmployee[index].email}'),
            subtitle: Text('Phone : ${listEmployee[index].phone}'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: listEmployee.length,
      ),
    );
  }
}

class UserEmployee {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;

  UserEmployee(this.id, this.name, this.username, this.email, this.phone) {}

  UserEmployee.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      username = json['username'],
      email = json['email'],
      phone = json['phone'];
}
