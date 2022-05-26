// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors_in_immutables, await_only_futures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashiony/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class userd extends StatefulWidget {
  userd({Key? key}) : super(key: key);

  @override
  State<userd> createState() => _userdState();
}

class _userdState extends State<userd> {
  var c1 = const Color.fromRGBO(242, 234, 242, 3);
  var c2 = const Color.fromARGB(195, 79, 12, 60);
  var c3 = const Color.fromARGB(255, 238, 232, 238);
  var c4 = const Color.fromRGBO(242, 234, 242, 3);
  var c5 = Color.fromARGB(255, 79, 12, 60);
  final _editman = TextEditingController();
  del() {
    _editman.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Saved Measurement'),
          backgroundColor: c5,
        ),
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
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            color: c5,
                            child: ListTile(
                              title: Text(
                                snapshot.data!.docs[index]['Date Created']
                                    .toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Card(
                            color: c1,
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                FirebaseFirestore.instance
                                                    .collection('Measurement' +
                                                        Auth()
                                                            ._auth
                                                            .currentUser!
                                                            .uid)
                                                    .doc(
                                                        '${snapshot.data!.docs[index].id}')
                                                    .update({
                                                  'Arm Hole':
                                                      _editman.text.trim(),
                                                });
                                                del();
                                              });
                                            },
                                            icon: Icon(Icons.save))
                                      ],
                                      content: TextFormField(
                                        controller: _editman,
                                      ),
                                      title: Text('EDIT DETAILS'),
                                    ),
                                    context: context,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: c5,
                                ),
                              ),
                              title: Text(
                                snapshot.data!.docs[index]['Arm Hole'],
                                style: TextStyle(color: c5),
                              ),
                            ),
                          ),
                          Card(
                            color: c1,
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                FirebaseFirestore.instance
                                                    .collection('Measurement' +
                                                        Auth()
                                                            ._auth
                                                            .currentUser!
                                                            .uid)
                                                    .doc(
                                                        '${snapshot.data!.docs[index].id}')
                                                    .update({
                                                  'Arm Lenth':
                                                      _editman.text.trim()
                                                });
                                                del();
                                              });
                                            },
                                            icon: Icon(Icons.save))
                                      ],
                                      content: TextFormField(
                                        controller: _editman,
                                      ),
                                      title: Text('EDIT DETAILS'),
                                    ),
                                    context: context,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: c5,
                                ),
                              ),
                              title: Text(
                                snapshot.data!.docs[index]['Arm Lenth'],
                                style: TextStyle(color: c5),
                              ),
                            ),
                          ),
                          Card(
                            color: c1,
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                FirebaseFirestore.instance
                                                    .collection('Measurement' +
                                                        Auth()
                                                            ._auth
                                                            .currentUser!
                                                            .uid)
                                                    .doc(
                                                        '${snapshot.data!.docs[index].id}')
                                                    .update({
                                                  'Back Deth':
                                                      _editman.text.trim()
                                                });
                                                del();
                                              });
                                            },
                                            icon: Icon(Icons.save))
                                      ],
                                      content: TextFormField(
                                        controller: _editman,
                                      ),
                                      title: Text('EDIT DETAILS'),
                                    ),
                                    context: context,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: c5,
                                ),
                              ),
                              title: Text(
                                snapshot.data!.docs[index]['Back Deth'],
                                style: TextStyle(color: c5),
                              ),
                            ),
                          ),
                          Card(
                            color: c1,
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                FirebaseFirestore.instance
                                                    .collection('Measurement' +
                                                        Auth()
                                                            ._auth
                                                            .currentUser!
                                                            .uid)
                                                    .doc(
                                                        '${snapshot.data!.docs[index].id}')
                                                    .update({
                                                  'Burst Measurement':
                                                      _editman.text.trim()
                                                });
                                                del();
                                              });
                                            },
                                            icon: Icon(Icons.save))
                                      ],
                                      content: TextFormField(
                                        controller: _editman,
                                      ),
                                      title: Text('EDIT DETAILS'),
                                    ),
                                    context: context,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: c5,
                                ),
                              ),
                              title: Text(
                                snapshot.data!.docs[index]['Burst Measurement'],
                                style: TextStyle(color: c5),
                              ),
                            ),
                          ),
                          Card(
                            color: c1,
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                FirebaseFirestore.instance
                                                    .collection('Measurement' +
                                                        Auth()
                                                            ._auth
                                                            .currentUser!
                                                            .uid)
                                                    .doc(
                                                        '${snapshot.data!.docs[index].id}')
                                                    .update({
                                                  'Front Deth':
                                                      _editman.text.trim()
                                                });
                                                del();
                                              });
                                            },
                                            icon: Icon(Icons.save))
                                      ],
                                      content: TextFormField(
                                        controller: _editman,
                                      ),
                                      title: Text('EDIT DETAILS'),
                                    ),
                                    context: context,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: c5,
                                ),
                              ),
                              title: Text(
                                snapshot.data!.docs[index]['Front Deth'],
                                style: TextStyle(color: c5),
                              ),
                            ),
                          ),
                          Card(
                            color: c1,
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                FirebaseFirestore.instance
                                                    .collection('Measurement' +
                                                        Auth()
                                                            ._auth
                                                            .currentUser!
                                                            .uid)
                                                    .doc(
                                                        '${snapshot.data!.docs[index].id}')
                                                    .update({
                                                  'Hip Lenth':
                                                      _editman.text.trim()
                                                });
                                                del();
                                              });
                                            },
                                            icon: Icon(Icons.save))
                                      ],
                                      content: TextFormField(
                                        controller: _editman,
                                      ),
                                      title: Text('EDIT DETAILS'),
                                    ),
                                    context: context,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: c5,
                                ),
                              ),
                              title: Text(
                                snapshot.data!.docs[index]['Hip Lenth'],
                                style: TextStyle(color: c5),
                              ),
                            ),
                          ),
                          Card(
                            color: c1,
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                FirebaseFirestore.instance
                                                    .collection('Measurement' +
                                                        Auth()
                                                            ._auth
                                                            .currentUser!
                                                            .uid)
                                                    .doc(
                                                        '${snapshot.data!.docs[index].id}')
                                                    .update({
                                                  'Shoulder':
                                                      _editman.text.trim()
                                                });
                                                del();
                                              });
                                            },
                                            icon: Icon(Icons.save))
                                      ],
                                      content: TextFormField(
                                        controller: _editman,
                                      ),
                                      title: Text('EDIT DETAILS'),
                                    ),
                                    context: context,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: c5,
                                ),
                              ),
                              title: Text(
                                snapshot.data!.docs[index]['Shoulder'],
                                style: TextStyle(color: c5),
                              ),
                            ),
                          ),
                          Card(
                            color: c1,
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                FirebaseFirestore.instance
                                                    .collection('Measurement' +
                                                        Auth()
                                                            ._auth
                                                            .currentUser!
                                                            .uid)
                                                    .doc(
                                                        '${snapshot.data!.docs[index].id}')
                                                    .update({
                                                  'Sleeves Lenth':
                                                      _editman.text.trim()
                                                });
                                                del();
                                              });
                                            },
                                            icon: Icon(Icons.save))
                                      ],
                                      content: TextFormField(
                                        controller: _editman,
                                      ),
                                      title: Text('EDIT DETAILS'),
                                    ),
                                    context: context,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: c5,
                                ),
                              ),
                              title: Text(
                                snapshot.data!.docs[index]['Sleeves Lenth'],
                                style: TextStyle(color: c5),
                              ),
                            ),
                          ),
                          Card(
                            color: c1,
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                FirebaseFirestore.instance
                                                    .collection('Measurement' +
                                                        Auth()
                                                            ._auth
                                                            .currentUser!
                                                            .uid)
                                                    .doc(
                                                        '${snapshot.data!.docs[index].id}')
                                                    .update({
                                                  'Sleeves Opening':
                                                      _editman.text.trim()
                                                });
                                                del();
                                              });
                                            },
                                            icon: Icon(Icons.save))
                                      ],
                                      content: TextFormField(
                                        controller: _editman,
                                      ),
                                      title: Text('EDIT DETAILS'),
                                    ),
                                    context: context,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: c5,
                                ),
                              ),
                              title: Text(
                                snapshot.data!.docs[index]['Sleeves Opening'],
                                style: TextStyle(color: c5),
                              ),
                            ),
                          ),
                          Card(
                            color: c1,
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                FirebaseFirestore.instance
                                                    .collection('Measurement' +
                                                        Auth()
                                                            ._auth
                                                            .currentUser!
                                                            .uid)
                                                    .doc(
                                                        '${snapshot.data!.docs[index].id}')
                                                    .update({
                                                  'Waist': _editman.text.trim()
                                                });
                                                del();
                                              });
                                            },
                                            icon: Icon(Icons.save))
                                      ],
                                      content: TextFormField(
                                        controller: _editman,
                                      ),
                                      title: Text('EDIT DETAILS'),
                                    ),
                                    context: context,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: c5,
                                ),
                              ),
                              title: Text(
                                snapshot.data!.docs[index]['Waist'],
                                style: TextStyle(color: c5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
          },
        ));
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
