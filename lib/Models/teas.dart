import 'package:flutter/material.dart';

class sdsadd extends StatefulWidget {
  sdsadd({Key? key}) : super(key: key);

  @override
  State<sdsadd> createState() => _sdsaddState();
}

class _sdsaddState extends State<sdsadd> {
  final items = List<String>.generate(100, (i) => "List item $i");
  var _controller = TextEditingController();
  de() {
    _controller.clear();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return (ListTile(
                title: Text('${items[index]}'),
                trailing: Stack(children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          showDialog(
                            barrierDismissible: false,
                            builder: (context) => AlertDialog(
                              title: Text('Edit'),
                              content: Form(
                                child: TextFormField(
                                  controller: _controller,
                                ),
                              ),
                              actions: [
                                TextButton.icon(
                                    onPressed: () async {
                                      final String newText = _controller.text;

                                      if (newText == '') {
                                        await showDialog(
                                          builder: (context) => AlertDialog(
                                            title: Text('WARNING'),
                                            content: Text('Enter Text'),
                                            actions: [
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(Icons.close))
                                            ],
                                          ),
                                          context: context,
                                        );
                                      } else {
                                        setState(() {
                                          items[index] = newText;
                                          Navigator.pop(context, de());
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.save),
                                    label: Text('Save')),
                                TextButton.icon(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.cancel),
                                    label: Text('Cancel'))
                              ],
                            ),
                            context: context,
                          );
                        });
                      },
                      icon: Icon(Icons.edit)),
                ]),
              ));
            }),
      ),
    );
  }
}
