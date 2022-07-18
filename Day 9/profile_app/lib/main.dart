import 'package:flutter/material.dart';
import 'package:profile_app/model/model.dart';
import 'package:profile_app/ui/dashboard.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Profile App",
    home: Dashboard(),
  ));
}

// class LoaderScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Model modelObj = Model();

//     return Dashboard(
//       modelObj: modelObj,
//     );
//   }
// }
