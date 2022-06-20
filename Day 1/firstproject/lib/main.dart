import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "FirstApp",
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("First App"),
      ),
      body: Column(
        children: [
          Center(
            child: Image.network(
              'https://cdn.pixabay.com/photo/2020/03/17/12/02/vietnam-4940068_1280.jpg',
              width: 300,
              height: 200,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Name : Shiwani Magar",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.purpleAccent,
            ),
          ),
          const Text(
            " Faculty: Management",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const Text(
            " Call me later ",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const Text("Hajmola jya aaunxa majalya pachaunxa")
        ],
      ),
    ),
  ));
}
