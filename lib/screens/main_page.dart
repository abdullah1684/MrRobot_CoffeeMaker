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

final String path = '/test2/boolean';

sendBooleanValue(bool value) async {
  await database.child(path).set(value).then((_) {
    print('Boolean value sent successfully!');
  }).catchError((error) {
    print('Error sending boolean value: $error');
  });
}

Future<void> _mdri() async {
  final user = await _firebase.signInWithEmailAndPassword(
      email: "test@gmail.com", password: "12345678");
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

  await ref.set({
    "name": "John",
    "age": 18,
    "address": {"line1": "100 Mountain View"}
  });
}

class _MainPageState extends State<MainPage> {
  var _isCoffee = true;
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
              onPressed: _mdri,
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
