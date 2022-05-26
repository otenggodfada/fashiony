// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, curly_braces_in_flow_control_structures

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashiony/Models/teas.dart';
import 'package:fashiony/usersdd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Save_Measurement extends StatefulWidget {
  Save_Measurement({Key? key}) : super(key: key);

  @override
  State<Save_Measurement> createState() => _Save_MeasurementState();
}

class _Save_MeasurementState extends State<Save_Measurement> {
  @override
  var counter = 3;
  var c1 = const Color.fromRGBO(242, 234, 242, 3);
  var c2 = const Color.fromARGB(195, 79, 12, 60);
  var c3 = const Color.fromARGB(255, 238, 232, 238);
  var c4 = const Color.fromRGBO(242, 234, 242, 3);
  var c5 = Color.fromARGB(255, 79, 12, 60);
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: Text('Saved Measurement'),
          backgroundColor: c5,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: c1,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Measurement' + Auth()._auth.currentUser!.uid)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Column(
                    children: [
                      Text('WAITING FOR DATA.....'),
                      SizedBox(
                        height: 10,
                      ),
                      CircularProgressIndicator()
                    ],
                  ),
                );
              } else
                return ListView(
                  children: snapshot.data!.docs.map((document) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            child: Card(
                              color: c5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'DATE CREATED:',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    document['Date Created'].toString(),
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Card(
                              elevation: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'SHOULDER:',
                                    style: TextStyle(color: c5),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    document['Shoulder'],
                                    style: TextStyle(color: c5),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Get.offAll(() => userd());
                                      },
                                      icon: Icon(
                                        Icons.edit_sharp,
                                        color: c5,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            child: Card(
                              elevation: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'ARM HOLE:',
                                    style: TextStyle(color: c5),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    document['Arm Hole'],
                                    style: TextStyle(color: c5),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit_sharp,
                                        color: c5,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            child: Card(
                              elevation: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'ARM LENTH:',
                                    style: TextStyle(color: c5),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    document['Arm Lenth'],
                                    style: TextStyle(color: c5),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit_sharp,
                                        color: c5,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            child: Card(
                              elevation: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'BACK DETH:',
                                    style: TextStyle(color: c5),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    document['Back Deth'],
                                    style: TextStyle(color: c5),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit_sharp,
                                        color: c5,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            child: Card(
                              elevation: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'BURST:',
                                    style: TextStyle(color: c5),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    document['Burst Measurement'],
                                    style: TextStyle(color: c5),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit_sharp,
                                        color: c5,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            child: Card(
                              elevation: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'FRONT DETH:',
                                    style: TextStyle(color: c5),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    document['Front Deth'],
                                    style: TextStyle(color: c5),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit_sharp,
                                        color: c5,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            child: Card(
                              elevation: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'HIP LENTH:',
                                    style: TextStyle(color: c5),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    document['Hip Lenth'],
                                    style: TextStyle(color: c5),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit_sharp,
                                        color: c5,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            child: Card(
                              elevation: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'SLEEVES LENTH:',
                                    style: TextStyle(color: c5),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    document['Sleeves Lenth'],
                                    style: TextStyle(color: c5),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit_sharp,
                                        color: c5,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            child: Card(
                              elevation: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'SLEEVES OPENING:',
                                    style: TextStyle(color: c5),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    document['Sleeves Opening'],
                                    style: TextStyle(color: c5),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit_sharp,
                                        color: c5,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            child: Card(
                              elevation: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'WAIST:',
                                    style: TextStyle(color: c5),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    document['Waist'],
                                    style: TextStyle(color: c5),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit_sharp,
                                        color: c5,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
            }));
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromARGB(195, 79, 12, 60),
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.only(left: 7),
            child: Text(
              'Loading....',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}

class Auth {
  final _auth = FirebaseAuth.instance;
  Future dkakUid() async {
    return (await _auth.currentUser)!.uid;
  }

  Future getUser() async {
    return await _auth.currentUser!;
  }
}
