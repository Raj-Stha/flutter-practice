import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_app/model/model.dart';
import 'package:profile_app/ui/dashboard.dart';

// ignore: use_key_in_widget_constructors
class CreateProfile extends StatefulWidget {
  @override
  // late Model? modelObj;
  // CreateProfile({required this.modelObj, Key? key}) : super(key: key);
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  File? selectedImage;

  final formKey = GlobalKey<FormState>();
  late String userImage = "";
  late String imageType;
  // late Model  modelObj;

  Future<void> pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
      userImage = selectedImage
          .toString()
          .substring(7, selectedImage.toString().length - 1);
    });
  }

  TextEditingController pickedDate = TextEditingController();
  void showDate() async {
    DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2025));
    if (selected == null) {
      return;
    } else {
      pickedDate.text = selected.toString().substring(0, 10);
    }
  }

  TextEditingController fullName = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();
  // TextEditingController date = TextEditingController();
  List userData = [];

  void createUserProfile() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (userImage.isEmpty) {
        userImage = "assets/images/user-profile.jpg";
        imageType = "assets";
      } else {
        imageType = "file";
      }

      // widget.modelObj!.addNewProfile(fullName.text, age.text, email.text,
      //     pickedDate.text, userImage, imageType);

      Model.userData.add({
        "fullName": fullName.text,
        "age": age.text,
        "email": email.text,
        "date": pickedDate.text,
        "imageURL": userImage,
        "imageType": imageType,
      });

      // Model.profileImages.add(selectedImage!);
      // debugPrint(Model.userData[0]["imageURL"]);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Profile"),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              GestureDetector(
                onTap: pickImage,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: selectedImage != null
                            ? Image.file(
                                selectedImage!,
                                fit: BoxFit.cover,
                                width: 400,
                              )
                            : Image.asset(
                                "assets/images/user-profile.jpg",
                                width: 300,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const Positioned(
                      top: 75,
                      left: 70,
                      child: Icon(
                        Icons.add_a_photo,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20.0),
                          label: const Text(
                            "Full Name",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.account_circle_outlined,
                            size: 30.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        controller: fullName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }

                          // ScaffoldMessenger.of(context)
                          //     .showSnackBar(SnackBar(content: Text(data)));
                        },
                        // debugPrint(value);
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: age,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: const Text(
                            "Age",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.account_circle_outlined,
                            size: 30.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (age.text.isEmpty) {
                            return "Please enter your age";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          label: const Text(
                            "Email",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            size: 30.0,
                          ),
                        ),
                        validator: (value) {
                          if (email.text.isEmpty) {
                            return "Please Enter your email";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: pickedDate,
                        decoration: InputDecoration(
                          label: const Text(
                            "Date",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.date_range_outlined,
                            size: 30.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter your date";
                          }
                        },
                        onTap: showDate,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: createUserProfile,
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple[400]),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Create",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
