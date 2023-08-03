import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

void _submit() async {
  final url =
      Uri.https("mrrobot-coffeemaker-default-rtdb.firebaseio.com", "/test");
  final response = await http.get(url);
  final extractedData = json.decode(response.body);
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
          const Center(
            child: ElevatedButton(
              onPressed: _submit,
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
