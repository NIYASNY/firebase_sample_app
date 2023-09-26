import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Updateuser extends StatefulWidget {
  const Updateuser({super.key});

  @override
  State<Updateuser> createState() => _UpdateuserState();
}

class _UpdateuserState extends State<Updateuser> {
  final bloodgroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedGroups;

  final CollectionReference auth =
      FirebaseFirestore.instance.collection('auth');

  TextEditingController username = TextEditingController();
  TextEditingController usernumber = TextEditingController();

  void updateuser(docId) {
    final data = {
      'name': username.text,
      'number': usernumber.text,
      'group': selectedGroups,
    };
    auth.doc(docId).update(data).then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    username.text = args['name'];
    usernumber.text = args['number'].toString();
    selectedGroups = args['group'];
    final docId = args['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Update User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: username,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text('user name')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: usernumber,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('user number')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  value: selectedGroups,
                  decoration:
                      InputDecoration(label: Text('Select Blood Group')),
                  items: bloodgroups
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    selectedGroups = val as String?;
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  updateuser(docId);
                },
                child: Text('Update'))
          ],
        ),
      ),
    );
  }
}
