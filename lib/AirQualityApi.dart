import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: AirQualityApi()));
}

class AirQualityApi extends StatefulWidget {
  @override
  State<AirQualityApi> createState() => _AirQualityApiState();
}

class _AirQualityApiState extends State<AirQualityApi> {
  int? aqi;
  String? city;
  double? temp;

  void fetchData() async {
    var url = Uri.parse(
      "https://api.waqi.info/feed/here/?token=8a0e204adb846c374bde6a7b80548c8de84f864e",
    );
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      setState(() {
        aqi = data["data"]["aqi"];
        city = data["data"]["city"]["name"];
        temp = data["data"]["iaqi"]["t"]["v"].toDouble();
      });
    } else {
      print("Failed to load data");
    }
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
        title: Text("Air Quality Index (AQI)"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.lightBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: aqi == null
              ? CircularProgressIndicator(color: Colors.white)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " $city",
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    if (aqi! > 50 && aqi! < 101)
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "$aqi",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    SizedBox(height: 30),
                    Text(
                      'Moderate',
                      style: TextStyle(fontSize: 40, color: Colors.yellow),
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Temperature: ${temp} °C",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: fetchData,
                      child: Text("Refresh"),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
