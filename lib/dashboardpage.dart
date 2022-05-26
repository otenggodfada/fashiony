// ignore_for_file: camel_case_types, must_be_immutable, prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, unnecessary_new, await_only_futures

import 'dart:async';
import 'dart:core';

import 'package:fashiony/Models/saved_measurements.dart';
import 'package:fashiony/usersdd.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashiony/Models/measurementpage.dart';
import 'package:fashiony/Models/modelpage.dart';
import 'package:fashiony/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dashboard extends StatefulWidget {
  bool isLoading = false;
  dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  var counter = 3;
  var c1 = const Color.fromRGBO(242, 234, 242, 3);
  var c2 = const Color.fromARGB(195, 79, 12, 60);
  var c3 = const Color.fromARGB(255, 238, 232, 238);
  var c4 = const Color.fromRGBO(242, 234, 242, 3);
  var c5 = Color.fromARGB(255, 79, 12, 60);
  int _currentIndex = 0;
  final _namechangeController = TextEditingController();
  final _emailchangeController = TextEditingController();
  final _numberchangeController = TextEditingController();

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
          title: Text('Mobile Fashion App(Fashiony)'),
          actions: [
            // IconButton(
            //     onPressed: () {
            //       showprofile();
            //     },
            //     icon: Icon(Icons.person)),
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAll(() => home());
                },
                icon: Icon(Icons.settings_power))
          ],
          backgroundColor: c5,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: c1,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Users' + Auth()._auth.currentUser!.uid)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return Container(
                    child: Center(
                      child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.asset('assets/images/bgn.png')
                                      .image)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child:
                                        Image.asset('assets/images/nice.png'),
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 210, 190, 213)),
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 160,
                                child: Stack(
                                  children: [
                                    Card(
                                      child: Row(
                                        children: [
                                          Stack(
                                            children: [
                                              Image.asset(
                                                  'assets/images/logo2.png'),
                                              Icon(Icons.edit),
                                            ],
                                          ),
                                          Container(
                                            height: 140,
                                            width: 1,
                                            decoration:
                                                BoxDecoration(color: c5),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Stack(
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    edituser();
                                                  },
                                                  child: Icon(Icons.edit)),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.verified_user,
                                                        color: c5,
                                                      ),
                                                      Text(
                                                        document['name'],
                                                        style: TextStyle(
                                                            color: c5),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(Icons.numbers,
                                                          color: c5),
                                                      Text(document['number'],
                                                          style: TextStyle(
                                                              color: c5))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(Icons.email,
                                                          color: c5),
                                                      Text(document['email'],
                                                          style: TextStyle(
                                                              color: c5))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [],
                                  ),
                                  //Rt
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          height: 200,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(measurment());
                                            },
                                            child: Card(
                                              child: Image.asset(
                                                'assets/images/dma.png',
                                                color: c5,
                                              ),
                                              borderOnForeground: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          height: 200,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(() => moDel());
                                            },
                                            child: Card(
                                              child: Image.asset(
                                                'assets/images/sty.png',
                                                color: c5,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),

                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: (() {
                                            Get.to(userd());
                                          }),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            height: 200,
                                            child: Card(
                                              child: Image.asset(
                                                'assets/images/domq.png',
                                                color: c5,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            wshowLoaderDialog(context);
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            height: 200,
                                            child: Card(
                                              child: Image.asset(
                                                'assets/images/ord.png',
                                                color: c5,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  //start here
                                ],
                              ),
                            ],
                          )),
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

  edituser() {
    showDialog(
      builder: (context) => AlertDialog(
        actions: [],
        content: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Users' + Auth()._auth.currentUser!.uid)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: snapshot.data!.docs.map((document) {
                  return Container(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _namechangeController
                            ..text = document['name'],
                          decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: c1,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1, color: c2)),
                              labelText: 'Name',
                              prefixIcon: const Icon(Icons.person)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _emailchangeController
                            ..text = document['email'],
                          decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: c1,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1, color: c2)),
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.email)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _numberchangeController
                            ..text = document['number'],
                          decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: c1,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1, color: c2)),
                              labelText: 'Name',
                              prefixIcon: const Icon(Icons.person)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                FirebaseFirestore.instance
                                    .collection(
                                        'Users' + Auth()._auth.currentUser!.uid)
                                    .doc('Hellow World')
                                    .update({
                                  'email': _emailchangeController.text.trim(),
                                  'number': _numberchangeController.text.trim(),
                                  'name': _namechangeController.text.trim()
                                });
                              });
                            },
                            icon: Icon(Icons.save))
                      ],
                    ),
                  );
                }).toList(),
              );
            }),
        title: Text('EDIT PROFILE'),
      ),
      context: context,
    );
  }

  wshowLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromARGB(195, 79, 12, 60),
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 7),
            child: Text(
              'Comming Soon',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  showprofile() {
    showDialog(
      builder: (context) => AlertDialog(
        actions: [
          IconButton(
              onPressed: () {
                navigator?.pop();
                ;
              },
              icon: Icon(Icons.close))
        ],
        content: Container(height: 100, child: Column()),
        title: Text('USER DETAILS'),
      ),
      context: context,
    );
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
