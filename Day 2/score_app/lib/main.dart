// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

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
  int num = 0;
  void increase() {
    setState(() {
      num++;
    });
  }

  void decrease() {
    setState(() {
      if (num != 0) {
        num--;
      }
    });
  }

  void reset() {
    setState(() {
      num = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Score App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reset,
        child: const Icon(Icons.restart_alt_outlined),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 80.0,
          ),
          const Text(
            "Score",
            style: TextStyle(color: Colors.deepPurple, fontSize: 50),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            num.toString(),
            style: TextStyle(color: Colors.teal, fontSize: 70),
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Increase",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onPressed: increase,
              ),
              const SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Decrease",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onPressed: decrease,
              ),
            ],
          )
        ],
      ),
    );
  }
}
