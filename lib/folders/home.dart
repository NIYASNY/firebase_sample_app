import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

  Future<void> logout() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  await googleSignIn.signOut();
}

class _MyHomePageState extends State<MyHomePage> {
  final CollectionReference auth =
      FirebaseFirestore.instance.collection('auth');

  void deleteuser(docId) {
    auth.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Firebase_App'),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  logout();
                  Navigator.pushNamed(context, '/');
                },
                child: Icon(Icons.logout)
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: StreamBuilder(
        stream: auth.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot authsnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 30,
                            child: Text(authsnap['group'].toString()),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              authsnap['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              authsnap['number'].toString(),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/update',
                                    arguments: {
                                      'name': authsnap['name'],
                                      'number': authsnap['number'],
                                      'group': authsnap['group'],
                                      'id': authsnap.id,
                                    });
                              },
                              icon: Icon(Icons.edit),
                              iconSize: 30,
                            ),
                            IconButton(
                              onPressed: () {
                                deleteuser(authsnap.id);
                              },
                              icon: Icon(Icons.delete),
                              iconSize: 30,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
