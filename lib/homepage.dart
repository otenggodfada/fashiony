// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:fashiony/loginpage.dart';
import 'package:fashiony/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  //Colors
  var c1 = const Color.fromRGBO(242, 234, 242, 3);
  var c2 = Color.fromARGB(195, 79, 12, 60);
  var c3 = const Color.fromARGB(255, 238, 232, 238);
  var c4 = const Color.fromRGBO(242, 234, 242, 3);

  //TextControllers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: c1,
      body: SafeArea(
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: c3,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset('assets/images/bgn.png').image)),
              child: Column(
                children: [
                  //Logo image
                  Image.asset(
                    'assets/images/nice.png',
                    width: 170,
                  ),
//SIGNUP AND SIGNIN BUTTONS
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 90, 0, 70),
                      child: Container(
                        child: Column(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Get.to(signup());
                              },
                              icon: Icon(Icons.account_circle),
                              label: Text('Signup'),
                              style: ElevatedButton.styleFrom(
                                  visualDensity:
                                      const VisualDensity(horizontal: 0.1),
                                  fixedSize: const Size(200, 60),
                                  primary: c2),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Get.to(login());
                              },
                              icon: Icon(Icons.login),
                              label: Text('Signin'),
                              style: ElevatedButton.styleFrom(
                                  visualDensity:
                                      const VisualDensity(horizontal: 0.1),
                                  fixedSize: const Size(200, 60),
                                  primary: c2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
