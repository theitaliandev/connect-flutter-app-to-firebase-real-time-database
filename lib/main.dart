import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(MaterialApp(
    home: MainActivity(),
  ));
}


class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {

  final DatabaseReference database = FirebaseDatabase.instance.reference().child("test");


  sendData() {
    database.push().set({
      'name' : 'Chuck',
      'lastName' : 'Norris'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: FlatButton(
            onPressed: () => sendData(),
            child: Text("Send"),
        color: Colors.amber),
      ),
    );
  }
}
