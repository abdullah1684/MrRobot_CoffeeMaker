import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;
final DatabaseReference database = FirebaseDatabase.instance.reference();

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

const String path = '/make/bool';

sendBooleanValue(bool value) async {
  await _firebase.signInWithEmailAndPassword(
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
    final deviceData = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Hacker'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 206, 193, 188),
          Color.fromARGB(255, 119, 94, 85),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        width: deviceData.width,
        height: deviceData.height,
        child: Stack(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isCoffee = !_isCoffee;
                  });
                  sendBooleanValue(_isCoffee);
                },
                child: SizedBox(
                  width: deviceData.width * 0.3,
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
      ),
    );
  }
}
