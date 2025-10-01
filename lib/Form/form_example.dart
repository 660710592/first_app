import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  String? selectGender;
  bool isChecked = false;
  String? marresStatus = 'Single';
  bool isReceiveNews = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ForExample')),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'FirstName'),
              controller: nameController,
              //onChanged: (Value) {
              //setState(() {
              //firstName = Value;
              //});
              //},
              validator: (String? Value) {
                if (Value == null || Value.isEmpty) {
                  return "Please enter first name";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'LastName'),
              controller: lastnameController,
              //onChanged: (Value) {
              //setState(() {
              //  lastName = Value;
              // });
              //},
              validator: (String? Value) {
                if (Value == null || Value.isEmpty) {
                  return "Please enter last name";
                }
                return null;
              },
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Gender'),
              value: selectGender,
              items: ['Male', 'Female', 'Other']
                  .map(
                    (String item) =>
                        DropdownMenuItem(value: item, child: Text('$item')),
                  )
                  .toList(),
              onChanged: (String? Value) {
                setState(() {
                  selectGender = Value;
                });
              },
              validator: (String? Value) {
                if (Value == null || Value.isEmpty) {
                  return "Please enter Gender";
                }
                return null;
              },
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Single'),
                  value: 'Single',
                  groupValue: marresStatus,
                  onChanged: (String? value) {
                    setState(() {
                      marresStatus = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Married'),
                  value: 'Married',
                  groupValue: marresStatus,
                  onChanged: (String? value) {
                    setState(() {
                      marresStatus = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Separated'),
                  value: 'Separated',
                  groupValue: marresStatus,
                  onChanged: (String? value) {
                    setState(() {
                      marresStatus = value.toString();
                    });
                  },
                ),
              ],
            ),

            SwitchListTile(
              title: Text('Enable Receive News'),
              value: isReceiveNews,
              onChanged: (bool value) {
                setState(() {
                  isReceiveNews = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Accept Term & Conditions'),
              checkColor: Colors.red,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    nameController.clear();
                    lastnameController.clear();
                  },
                  child: Text('Clear'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      print(('Name : ${nameController.text}'));
                      print(('Name : ${lastnameController.text}'));
                    }
                  },
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    nameController.text = "Dev";
                    lastnameController.text = "Ops";
                  },
                  child: Text('Auto input'),
                ),
              ],
            ),

            SizedBox(height: 20),
            /*Container(
              color: Colors.green,
              child: Text(
                "Name : $firstName $lastName",
                style: TextStyle(fontSize: 26),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
