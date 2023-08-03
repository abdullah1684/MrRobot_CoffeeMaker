import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
              onPressed: () {},
              child: const SizedBox(
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
