import 'package:first_app/Week6/components/CustomCounterWidget.dart';
import 'package:first_app/Week6/components/Profile_card.dart';
import 'package:first_app/Week6/components/custom_card.dart';
import 'package:flutter/material.dart';

class SimpleCustomWidget extends StatefulWidget {
  const SimpleCustomWidget({super.key});

  @override
  State<SimpleCustomWidget> createState() => _SimpleCustomWidgetState();
}

class _SimpleCustomWidgetState extends State<SimpleCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('custom widget'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileCard(
              name: 'Patipan Watjanapron',
              position: 'Programer',
              email: 'patipan.wat@gmail.com',
              phoneNumber: '0821394214',
              imageUrl:
                  'https://www.storylines.com/hs-fs/hubfs/Blogs/Luxury%20Travel%20Lifestyle/Private%20resort%20pool.jpg?width=1200&height=800&name=Private%20resort%20pool.jpg',
            ),
          ],
        ),
        //CUSTOMCOUNTERWIDGET_OLD EXAMPLE
        /*child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Customcounterwidget(title: 'Team A', backgroundColor: Colors.red),
            SizedBox(height: 10),
            Customcounterwidget(title: 'Team B', backgroundColor: Colors.blue),
          ],
        ),*/
        //CUSTOMCARD EXAMPLE
        /*child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomCard(text: 'hellp', color: Colors.purple),
            CustomCard(text: 'world', color: Colors.green),
            CustomCard(text: 'good', color: Colors.blue),
            CustomCard(text: 'game'),
          ],
        ),
      ),*/
      ),
    );
  }
}
