import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? selectprovice;
  String? gender = 'Male';
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ForExample')),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'FUllName'),
              controller: fullnameController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter fullname";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Gmail'),
              controller: fullnameController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter Gmail";
                }
                return null;
              },
            ),
            Row(
              children: [
                RadioListTile(
                  title: Text('Male'),
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (String? value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Female'),
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (String? value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
              ],
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Province'),
              value: selectprovice,
              items: ['Bangkok', 'Chiang Mai', 'Phuket', 'Khon Kaen']
                  .map(
                    (String item) =>
                        DropdownMenuItem(value: item, child: Text('$item')),
                  )
                  .toList(),
              onChanged: (String? Value) {
                setState(() {
                  selectprovice = Value;
                });
              },
              validator: (String? Value) {
                if (Value == null || Value.isEmpty) {
                  return "Please enter Province";
                }
                return null;
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
          ],
        ),
      ),
    );
  }
}
