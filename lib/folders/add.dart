import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final bloodgroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedGroups;

  final CollectionReference auth =
      FirebaseFirestore.instance.collection('auth');

  TextEditingController username = TextEditingController();
  TextEditingController usernumber = TextEditingController();

  void adduser() {
    final data = {
      'name': username.text,
      'number': usernumber.text,
      'group': selectedGroups,
    };
    auth.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Add User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text('user name')),
                ),
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
                    if (selectedGroups != null) {
                      adduser();
                      Navigator.pop(context);
                    } else {
                      //error
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
