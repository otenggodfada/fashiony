// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_const_constructors_in_immutables, unnecessary_new, body_might_complete_normally_nullable, await_only_futures, unused_field

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashiony/dashboardpage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var c1 = const Color.fromRGBO(242, 234, 242, 3);
  var c2 = const Color.fromARGB(195, 79, 12, 60);
  var c3 = const Color.fromARGB(255, 238, 232, 238);
  var c4 = const Color.fromRGBO(242, 234, 242, 3);
  var c5 = const Color.fromARGB(255, 79, 12, 60);

  final _FullnameController = TextEditingController();
  final _EmailController = TextEditingController();
  final _PasswordController = TextEditingController();
  final _NumberController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  var counter = 3;

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: const Color.fromARGB(195, 79, 12, 60),
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text(
              'Loading',
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

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: c1,
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: c3,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset('assets/images/bgn.png').image)),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 190),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    //Enter Number

                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _NumberController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter phone number';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: const Color.fromARGB(
                                              56, 65, 10, 65),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: c2)),
                                          labelText: 'Phone number',
                                          hintText: 'Enter phone number',
                                          prefixIcon: const Icon(Icons.phone)),
                                    ),
                                    const SizedBox(height: 20),
                                    //Enter Fullname
                                    TextFormField(
                                      controller: _FullnameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter full name';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: const Color.fromARGB(
                                              56, 65, 10, 65),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: c2)),
                                          labelText: 'Fullname',
                                          hintText: 'Enter full name',
                                          prefixIcon: const Icon(Icons.person)),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      //Enter Email address
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _EmailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter valid email address';
                                        } else if (!value.contains('@') ||
                                            !value.contains('.')) {
                                          return 'Please enter valid email address';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: const Color.fromARGB(
                                              56, 65, 10, 65),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: c2)),
                                          labelText: 'Email',
                                          hintText: 'Enter email address',
                                          prefixIcon: const Icon(Icons.email)),
                                    ),
                                    const SizedBox(height: 20),
                                    //Enter Password
                                    TextFormField(
                                      obscureText: true,
                                      controller: _PasswordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Password can't be empty";
                                        } else if (value.length < 6) {
                                          return 'Password must be or more than 6 char';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: const Color.fromARGB(
                                              56, 65, 10, 65),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: c2)),
                                          labelText: 'Password',
                                          hintText: 'Enter password',
                                          prefixIcon: const Icon(Icons.lock)),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton.icon(
                              onPressed: () async {
                                //showLoaderDialog(context);

                                if (_formKey.currentState!.validate()) {
                                  // Navigator.pop(context);
                                }
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: _EmailController.text.trim(),
                                          password:
                                              _PasswordController.text.trim());

                                  final user = User(
                                      name: _FullnameController.text,
                                      email: _EmailController.text,
                                      number: _NumberController.text);

                                  createUser(user);

                                  Timer.periodic(const Duration(seconds: 1),
                                      (timer) {
                                    counter--;
                                    showLoaderDialog(context);
                                    if (counter == 0) {
                                      Get.offAll(() => dashboard());
                                      timer.cancel();
                                    }
                                  });
                                } catch (e) {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: c5,
                                          title: const Text('DATABASE ERROR'),
                                          content: const Text(
                                              'Check your details and try again'),
                                        );
                                      });
                                }
                              },
                              icon: const Icon(Icons.person_add),
                              label: const Text('Signup'),
                              style: ElevatedButton.styleFrom(
                                  visualDensity:
                                      const VisualDensity(horizontal: 0.1),
                                  fixedSize: const Size(160, 50),
                                  primary: c2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    ));
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance
        .collection('Users' + Auth()._auth.currentUser!.uid)
        .doc('Hellow World');

    final user = User(
        name: _FullnameController.text,
        id: docUser.id,
        email: _EmailController.text,
        number: _NumberController.text.toString());
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final String number;
  final String email;

  User({
    this.id = '',
    required this.name,
    required this.email,
    required this.number,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'number': number,
        'email': email,
      };
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
