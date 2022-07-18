import 'dart:html';

import 'package:flutter/material.dart';

class GestureCustomBtnn extends StatelessWidget {
  const GestureCustomBtnn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          child: const Text("Ges Tap Me !!"),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Hey there"),
                backgroundColor: Colors.deepOrangeAccent,
              ),
            );
          },
        ),
      ),
    );
  }
}
