import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List quotes = [
    "A mother is your first friend, your best friend, your forever friend",
    "When you are looking at your mother, you are looking at the purest love you will ever know",
    "Mother is the heartbeat in the home; and without her, there seems to be no heartthrob.",
    "Mothers are like glue",
    "A mother’s love is the fuel that enables a normal human being to do the impossible” – Marion C. Garretty.",
    "Mother’s love is peace. It need not be acquired, it need not be deserved.  – Erich Fromm",
  ];
  int counter = 0;

  void increment() {
    setState(() {
      if (counter == quotes.length - 1) {
        counter = 0;
      } else {
        counter++;
        debugPrint("$counter ---- ${quotes.length - 1}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quote App"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(color: Colors.blue[100]),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  quotes[counter],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton.icon(
              onPressed: increment,
              icon: const Icon(Icons.ac_unit),
              label: const Text("Quotes"),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
