// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Score App",
      home: ScoreApp(),
    ),
  );
}

class ScoreApp extends StatefulWidget {
  @override
  State<ScoreApp> createState() => _ScoreAppState();
}

class _ScoreAppState extends State<ScoreApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Score App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.restart_alt_outlined),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Score",
            style: TextStyle(color: Colors.deepPurple, fontSize: 50),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "0",
            style: TextStyle(color: Colors.teal, fontSize: 70),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Increase",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onPressed: () {},
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Decrease"),
              )
            ],
          )
        ],
      ),
    );
  }
}
