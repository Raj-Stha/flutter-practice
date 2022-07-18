// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double silderValue = 0.0;
  double billAmount = 0.0;
  double tipsAmount = 0.0;
  int personCount = 1;
  double totalPersonAmount = 0.0;
  void calculateTips() {
    tipsAmount = (billAmount * silderValue) / 100;

    totalPersonAmount = (billAmount + tipsAmount) / personCount.toDouble();
  }

  void personCounterDecrement() {
    if (personCount != 0) {
      setState(() {
        personCount--;
        calculateTips();
      });
    }
  }

  void personCounterIncrement() {
    setState(() {
      personCount++;
      calculateTips();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20.0),
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      "Total per person",
                      style: TextStyle(
                          fontSize: 24.0, color: Colors.deepPurple[500]),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      "${totalPersonAmount.round()}",
                      style: TextStyle(
                          fontSize: 34.0,
                          color: Colors.deepPurple.shade800,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03),
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Colors.grey.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: const InputDecoration(
                          // labelText: "Amount",
                          // labelStyle: TextStyle(fontSize: 20.0),
                          prefixIcon: Icon(Icons.attach_money_outlined),
                          // prefixText: "Bill Amount  ",
                          contentPadding: EdgeInsets.all(15.0),
                          hintText: "250",
                        ),
                        onChanged: (value) {
                          setState(() {
                            billAmount = double.parse(value);
                            calculateTips();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Split",
                        style: TextStyle(fontSize: 20.0),
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.deepPurpleAccent[100],
                        ),
                        child: InkWell(
                          child: const Text(
                            "-",
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                          onTap: personCounterDecrement,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "$personCount",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.deepPurpleAccent[600]),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.deepPurpleAccent[100],
                        ),
                        child: InkWell(
                          child: const Text(
                            "+",
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                          onTap: personCounterIncrement,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Tips",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "$tipsAmount",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.deepPurpleAccent[700],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                  child: Text(
                '$silderValue %',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.deepPurpleAccent[700],
                    fontWeight: FontWeight.bold),
              )),
              Slider(
                value: silderValue,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    silderValue = value.roundToDouble();
                    calculateTips();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
