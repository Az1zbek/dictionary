import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _eng = TextEditingController();
  final TextEditingController _uz = TextEditingController();

  void _addData(String key, String value) {
    FirebaseFirestore.instance.collection('dic').add({
      'eng': key,
      'uz': value,
    }).then((value) {
      print('Data added successfully');
    }).catchError((error) {
      print('Failed to add data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data to Firebase'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _eng,
              decoration: InputDecoration(
                labelText: 'Enter your word',
              ),
            ),
            TextFormField(
              controller: _uz,
              decoration: InputDecoration(
                labelText: 'sozni kiriting',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String key = _eng.text.trim();
                String value = _uz.text.trim();
                if (key.isNotEmpty && value.isNotEmpty) {
                  _addData(key, value);
                  _eng.clear();
                  _uz.clear();
                } else {
                  // Show a snackbar or any other error handling mechanism
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
