// ignore_for_file: deprecated_member_use, unnecessary_import

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashiony/Models/saved_measurements.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class measurment extends StatefulWidget {
  measurment({Key? key}) : super(key: key);

  @override
  State<measurment> createState() => _measurmentState();
}

class _measurmentState extends State<measurment> {
  var c1 = const Color.fromRGBO(242, 234, 242, 3);
  var c2 = const Color.fromARGB(195, 79, 12, 60);
  var c3 = const Color.fromARGB(255, 238, 232, 238);
  var c4 = const Color.fromRGBO(242, 234, 242, 3);
  var c5 = Color.fromARGB(255, 79, 12, 60);
  final _shoulder = TextEditingController();
  final _bust = TextEditingController();
  final _waist = TextEditingController();
  final _hip_lenth = TextEditingController();
  final _sleeves_lenth = TextEditingController();
  final _sleeves_opening = TextEditingController();

  final _arm_lenth = TextEditingController();
  final _front_deth = TextEditingController();
  final _arm_hole = TextEditingController();
  final _back_depth = TextEditingController();
  @override
  void del() {
    setState(() {
      _arm_hole.clear();
      _arm_lenth.clear();
      _back_depth.clear();
      _bust.clear();
      _front_deth.clear();
      _hip_lenth.clear();
      _shoulder.clear();
      _sleeves_lenth.clear();
      _sleeves_opening.clear();
      _waist.clear();
    });
  }

  void showSaved() {
    showDialog(
        context: context,
        // ignore: unnecessary_new
        builder: (BuildContext context) => new AlertDialog(
                title: new Text(''),
                content: Save_Measurement(),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ]));
  }

  final DateTime timeStamp = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 10,
        actions: [],
        title: Text('Measurement'),
        backgroundColor: c5,
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.asset('assets/images/bgn.png').image)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('Measurement' +
                                          Auth()._auth.currentUser!.uid)
                                      .add({
                                    'Shoulder':
                                        _shoulder.text.toString().trim(),
                                    'Burst Measurement':
                                        _bust.text.toString().trim(),
                                    'Waist': _waist.text.toString().trim(),
                                    'Hip Lenth':
                                        _hip_lenth.text.toString().trim(),
                                    'Sleeves Lenth':
                                        _sleeves_lenth.text.toString().trim(),
                                    'Arm Lenth':
                                        _arm_lenth.text.toString().trim(),
                                    'Front Deth':
                                        _front_deth.text.toString().trim(),
                                    'Arm Hole':
                                        _arm_hole.text.toString().trim(),
                                    'Back Deth':
                                        _back_depth.text.toString().trim(),
                                    'Sleeves Opening':
                                        _sleeves_opening.text.toString().trim(),
                                    'Date Created': timeStamp.toString()
                                  });

                                  // });
                                  del();
                                },
                                icon: Icon(
                                  Icons.save,
                                  color: c5,
                                ),
                                label: Text(
                                  'Save',
                                  style: TextStyle(color: c5),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: Container(
                                width: 1,
                                decoration: BoxDecoration(color: c5),
                              ),
                            ),
                            TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    del();
                                  });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: c5,
                                ),
                                label: Text(
                                  'Delete',
                                  style: TextStyle(color: c5),
                                )),
                          ],
                        ),
                        elevation: 7,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      //Enter Email address
                      keyboardType: TextInputType.number,
                      controller: _shoulder,

                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(56, 65, 10, 65),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: c2)),
                          labelText: 'Shoulder',
                          suffixIcon: Icon(Icons.rule),
                          suffix: Text('Inch'),
                          hintText: 'Shoulder Measurement',
                          prefixIcon: const Icon(Icons.insert_chart)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //Enter Email address
                      keyboardType: TextInputType.number,
                      controller: _bust,

                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(56, 65, 10, 65),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: c2)),
                          labelText: 'Burst',
                          suffixIcon: Icon(Icons.rule),
                          suffix: Text('Inch'),
                          hintText: 'Burst Measurement',
                          prefixIcon: const Icon(Icons.insert_chart)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //Enter Email address
                      keyboardType: TextInputType.number,
                      controller: _waist,

                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(56, 65, 10, 65),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: c2)),
                          labelText: 'Waist',
                          suffixIcon: Icon(Icons.rule),
                          suffix: Text('Inch'),
                          hintText: 'Waist Measurement',
                          prefixIcon: const Icon(Icons.insert_chart)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //Enter Email address
                      keyboardType: TextInputType.number,
                      controller: _hip_lenth,

                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(56, 65, 10, 65),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: c2)),
                          labelText: 'Hip Lenth',
                          suffixIcon: Icon(Icons.rule),
                          suffix: Text('Inch'),
                          hintText: 'Hip Lenth Measurement',
                          prefixIcon: const Icon(Icons.insert_chart)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //Enter Email address
                      keyboardType: TextInputType.number,
                      controller: _sleeves_lenth,

                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(56, 65, 10, 65),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: c2)),
                          labelText: 'Sleeves Lenth',
                          suffixIcon: Icon(Icons.rule),
                          suffix: Text('Inch'),
                          hintText: 'Sleeves Lenth Measurement',
                          prefixIcon: const Icon(Icons.insert_chart)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //Enter Email address
                      keyboardType: TextInputType.number,
                      controller: _arm_lenth,

                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(56, 65, 10, 65),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: c2)),
                          labelText: 'Arm Lenth',
                          suffixIcon: Icon(Icons.rule),
                          suffix: Text('Inch'),
                          hintText: 'Arm Lenth Measurement',
                          prefixIcon: const Icon(Icons.insert_chart)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //Enter Email address
                      keyboardType: TextInputType.number,
                      controller: _front_deth,

                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(56, 65, 10, 65),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: c2)),
                          labelText: 'Front Deth',
                          suffixIcon: Icon(Icons.rule),
                          suffix: Text('Inch'),
                          hintText: 'Front Deth Measurement',
                          prefixIcon: const Icon(Icons.insert_chart)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //Enter Email address
                      keyboardType: TextInputType.number,
                      controller: _arm_hole,

                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(56, 65, 10, 65),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: c2)),
                          labelText: 'Arm Hole',
                          suffixIcon: Icon(Icons.rule),
                          suffix: Text('Inch'),
                          hintText: 'Arm Hole Measurement',
                          prefixIcon: const Icon(Icons.insert_chart)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //Enter Email address
                      keyboardType: TextInputType.number,
                      controller: _back_depth,

                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(56, 65, 10, 65),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: c2)),
                          labelText: 'Back Deth',
                          suffixIcon: Icon(Icons.rule),
                          suffix: Text('Inch'),
                          hintText: 'Back Deth Measurement',
                          prefixIcon: const Icon(Icons.insert_chart)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //Enter Email address
                      keyboardType: TextInputType.number,
                      controller: _sleeves_opening,

                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: const Color.fromARGB(56, 65, 10, 65),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: c2)),
                          labelText: 'Sleeves Opening',
                          suffixIcon: Icon(Icons.rule),
                          suffix: Text('Inch'),
                          hintText: 'Sleeves Opening Measurement',
                          prefixIcon: const Icon(Icons.insert_chart)),
                    ),
                    RaisedButton.icon(
                        onPressed: () {
                          showSaved();
                        },
                        icon: Icon(Icons.history),
                        label: Text('Show Saved Measurements'))
                  ],
                )),
              ),
            ),
          ),
        ),
      ),
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
