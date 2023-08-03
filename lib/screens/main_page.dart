import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final _firebase = FirebaseAuth.instance;
final DatabaseReference database = FirebaseDatabase.instance.reference();

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

final String path = '/make/bool';

sendBooleanValue(bool value) async {
  final user = await _firebase.signInWithEmailAndPassword(
      email: "test@gmail.com", password: "12345678");

  await database.child(path).set(value).then((_) {
    print('Boolean value sent successfully!');
  }).catchError((error) {
    print('Error sending boolean value: $error');
  });
}

class _MainPageState extends State<MainPage> {
  var _isCoffee = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Hacker'),
      ),
      body: Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            child: Image.asset(
              'assets/images/coffeeMaker.jpg',
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isCoffee = !_isCoffee;
                });
                sendBooleanValue(_isCoffee);
              },
              child: SizedBox(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Make Coffee!'),
                    Icon(Icons.coffee),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
