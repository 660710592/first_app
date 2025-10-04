import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Assigment extends StatefulWidget {
  const Assigment({super.key});

  @override
  State<Assigment> createState() => _AssigmentState();
}

class _AssigmentState extends State<Assigment> {
  List<User> listUser = [];

  Future<void> fetchData() async {
    try {
      var response = await http.get(
        Uri.parse('http://localhost:8001/products'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          listUser = jsonList.map((item) => User.fromJson(item)).toList();
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> createProduct(String name, String desc, double price) async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:8001/products"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"name": name, "description": desc, "price": price}),
      );
      if (response.statusCode == 201) {
        fetchData();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product created successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProduct(
    int id,
    String name,
    String desc,
    double price,
  ) async {
    try {
      var response = await http.put(
        Uri.parse("http://localhost:8001/products/$id"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"name": name, "description": desc, "price": price}),
      );
      if (response.statusCode == 200) {
        fetchData();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product updated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      var response = await http.delete(
        Uri.parse("http://localhost:8001/products/$id"),
      );
      if (response.statusCode == 200) {
        await fetchData();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product deleted successfully!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void openForm({User? user}) {
    final nameController = TextEditingController(text: user?.name ?? "");
    final descController = TextEditingController(text: user?.description ?? "");
    final priceController = TextEditingController(
      text: user?.price.toString() ?? "",
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(user == null ? "Create Product" : "Update Product"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(labelText: "Description"),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final desc = descController.text;
                final price = double.tryParse(priceController.text) ?? 0.0;

                if (user == null) {
                  createProduct(name, desc, price);
                } else {
                  updateProduct(user.id, name, desc, price);
                }
                Navigator.pop(context);
              },
              child: Text(user == null ? "Create" : "Update"),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Example'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openForm(),
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final item = listUser[index];
          return ListTile(
            leading: CircleAvatar(child: Text("${item.id}")),
            title: Text(item.name),
            subtitle: Text('Description : ${item.description}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Price: ${item.price}",
                  style: TextStyle(color: Colors.green),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.black),
                  onPressed: () => openForm(user: item),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteProduct(item.id),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: listUser.length,
      ),
    );
  }
}

class User {
  final int id;
  final String name;
  final String description;
  final double price;

  User(this.id, this.name, this.description, this.price);

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      description = json['description'],
      price = (json['price'] as num).toDouble();
}
