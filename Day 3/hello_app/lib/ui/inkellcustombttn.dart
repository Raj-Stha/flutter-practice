import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class InkellCustomBttn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        hoverColor: Colors.purple[200],
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Tap ME!!!"),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Inkell"),
            backgroundColor: Colors.greenAccent,
            duration: Duration(seconds: 3),
          ));
        },
      ),
    );
  }
}
