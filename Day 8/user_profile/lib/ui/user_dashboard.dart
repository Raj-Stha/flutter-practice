import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: use_key_in_widget_constructors
class UserDashboard extends StatefulWidget {
  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  File? selectedImage;

  pickedImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 60,
            child: ClipOval(
              child: selectedImage != null
                  ? Image.file(
                      selectedImage!,
                      fit: BoxFit.contain,
                    )
                  : const Text("No Image"),
            ),
          ),
          ElevatedButton(onPressed: pickedImage, child: const Text("Click Me "))
        ],
      ),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UserDashboard extends StatefulWidget {
//   @override
//   State<UserDashboard> createState() => _UserDashboardState();
// }

// class _UserDashboardState extends State<UserDashboard> {
//   @override
//   Widget build(BuildContext context) {
//     // late String fullName;
//     // late String address;

//     // TextEditingController date = TextEditingController();

//     File? selectedImage;

//     pickedImage() async {
//       var image = await ImagePicker().pickImage(source: ImageSource.gallery);

//       setState(() {
//         selectedImage = File(image!.path);
//       });
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Create User Profile"),
//         backgroundColor: const Color.fromRGBO(53, 66, 90, 0.8),
//       ),
//       body: Column(
//         children: [
//           CircleAvatar(
//             radius: 60,
//             child: ClipOval(
//               child: selectedImage == null
//                   ? const Text("No Image")
//                   : Image.file(
//                       selectedImage!,
//                       fit: BoxFit.contain,
//                     ),
//             ),
//           ),
//           ElevatedButton(onPressed: pickedImage, child: const Text("Click Me "))
//           // GestureDetector(
//           //   onTap: pickedImage,
//           //   child: Stack(
//           //     children: [
//           //       // CircleAvatar(
//           //       //   backgroundImage: ,
//           //       //   radius: 60.0,
//           //       // ),
//           //       const Positioned(
//           //         top: 80.0,
//           //         left: 75.0,
//           //         child: Icon(
//           //           Icons.add_a_photo,
//           //           color: Color.fromRGBO(53, 66, 90, 0.8),
//           //           size: 40.0,
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//           ,
//           // const SizedBox(
//           //   height: 50,
//           // ),
//           // selectedImage == null
//           //     ? const Text("No Image")
//           //     : Image.file(selectedImage!),
//           // ElevatedButton(
//           //     onPressed: pickedImage, child: const Text("Sleetc Image")),
//           // TextFormField(
//           //   keyboardType: TextInputType.name,
//           //   decoration: const InputDecoration(
//           //       label: Text(
//           //         "Full Name",
//           //         style: TextStyle(fontSize: 20.0),
//           //       ),
//           //       prefixIcon: Icon(Icons.account_circle_sharp),
//           //       border: OutlineInputBorder()),
//           //   onChanged: (value) {
//           //     fullName = value;
//           //   },
//           //   validator: (value) {
//           //     if (value!.isNotEmpty) {
//           //       return "Please enter your Name";
//           //     }
//           //   },
//           // ),
//           // const SizedBox(
//           //   height: 15.0,
//           // ),
//           // TextFormField(
//           //   keyboardType: TextInputType.name,
//           //   decoration: const InputDecoration(
//           //       prefixIcon: Icon(Icons.add_location_outlined),
//           //       labelText: "Address",
//           //       border: OutlineInputBorder()),
//           //   onChanged: (value) {
//           //     address = value;
//           //   },
//           //   validator: (value) {
//           //     if (value!.isNotEmpty) {
//           //       return "Please enter your Address";
//           //     }
//           //   },
//           // ),
//           // TextFormField(
//           //   controller: date,
//           //   decoration: const InputDecoration(
//           //       labelText: "Date of Birth",
//           //       prefixIcon: Icon(Icons.date_range_outlined)),
//           //   onChanged: (value) {},
//           //   onTap: () async {
//           //     DateTime? selected = await showDatePicker(
//           //         context: context,
//           //         initialDate: DateTime.now(),
//           //         firstDate: DateTime(2015, 8),
//           //         lastDate: DateTime(2101));
//           //     if (selected == null) {
//           //       return;
//           //     } else {
//           //       date.text = selected.toString().substring(0, 10);
//           //     }
//           //   },
//           // ),
//         ],
//       ),
//     );
//   }
// }
