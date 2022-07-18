import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_app/model/model.dart';
import 'package:profile_app/ui/dashboard.dart';

// ignore: use_key_in_widget_constructors
class UpdateProfile extends StatefulWidget {
  @override
  late int userIndex;
  UpdateProfile({required this.userIndex, Key? key}) : super(key: key);
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  File? selectedImage;

  final formKey = GlobalKey<FormState>();
  late String userImage = "";
  late String imageType;
  TextEditingController pickedDate = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullName.text = Model.userData[widget.userIndex]['fullName'];
    age.text = Model.userData[widget.userIndex]['age'];
    email.text = Model.userData[widget.userIndex]['email'];
    pickedDate.text = Model.userData[widget.userIndex]['date'];
    imageType = Model.userData[widget.userIndex]['imageType'];
    userImage = Model.userData[widget.userIndex]['imageURL'];
  }

  Future<void> pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
      userImage = selectedImage
          .toString()
          .substring(7, selectedImage.toString().length - 1);
    });
  }

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

      Model.userData[widget.userIndex] = ({
        "fullName": fullName.text,
        "age": age.text,
        "email": email.text,
        "date": pickedDate.text,
        "imageURL": userImage,
        "imageType": imageType,
      });
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Updated")));

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  void deleteUser() {
    Model.userData.removeAt(widget.userIndex);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text(
        "Deleted Successfully",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurple[400],
    ));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Dashboard()));
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
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: deleteUser,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                      child: Text(
                        "Delete",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    )),
              ),
              const SizedBox(
                height: 10.0,
              ),
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
                            : imageType == "file"
                                ? Image.file(
                                    File(userImage),
                                    fit: BoxFit.cover,
                                    width: 400,
                                  )
                                : Image.asset(
                                    userImage,
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
                height: 30,
              ),
              Form(
                key: formKey,
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
                      },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
