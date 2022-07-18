import 'package:flutter/material.dart';
import 'package:hello_app/ui/gesture_custom_bttn.dart';
import 'package:hello_app/ui/inkellcustombttn.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatelessWidget {
  _ontapped() {
    debugPrint("Agained Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => debugPrint("tapped!!!"),
              icon: const Icon(Icons.ac_unit_rounded)),
          IconButton(
            onPressed: _ontapped,
            icon: const Icon(Icons.ac_unit_sharp),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
        ],
        onTap: (int index) {
          debugPrint("$index");
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [InkellCustomBttn(), GestureCustomBtnn()],
      ),
    );
  }
}
