// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:profile_app/model/model.dart';
import 'package:profile_app/ui/create_profile.dart';
import 'package:profile_app/ui/update_profile.dart';

class Dashboard extends StatefulWidget {
  @override
  // late Model? modelObj;
  // Dashboard({this.modelObj, Key? key}) : super(key: key);
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.deepPurple[400],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[400],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateProfile()));
        },
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Model.userData.isEmpty
            ? const Center(
                child: Text(
                  "Profile List is Empty",
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            : ListView.builder(
                itemCount: Model.userData.length,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UpdateProfile(
                                userIndex: index,
                              )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 10.0, right: 10.0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[100],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.15,
                                    10.0,
                                    10.0,
                                    10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Model.userData[index]["fullName"],
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      Model.userData[index]["email"],
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                    Text("Age: ${Model.userData[index]["age"]}")
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                alignment: Alignment.centerRight,
                                child:
                                    const Icon(Icons.arrow_forward_ios_sharp)),
                            Transform.translate(
                              offset: Offset(
                                  MediaQuery.of(context).size.width * (-0.15),
                                  0),
                              child: CircleAvatar(
                                radius: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Model.userData[index]['imageType'] ==
                                          "file"
                                      ? Image.file(
                                          File(Model.userData[index]
                                              ['imageURL']),
                                          fit: BoxFit.cover,
                                          width: 150,
                                        )
                                      : Image.asset(
                                          "${Model.userData[index]['imageURL']}",
                                          width: 300,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
