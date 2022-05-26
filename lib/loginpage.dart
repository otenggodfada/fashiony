// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, unused_field, non_constant_identifier_names, unnecessary_new, body_might_complete_normally_nullable

import 'dart:async';

import 'package:fashiony/dashboardpage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
                    padding: const EdgeInsets.fromLTRB(0, 90, 0, 190),
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
                                      .signInWithEmailAndPassword(
                                          email: _EmailController.text.trim(),
                                          password:
                                              _PasswordController.text.trim());

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
                              icon: const Icon(Icons.login),
                              label: const Text('Login'),
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
}
