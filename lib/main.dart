import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_using_app/folders/add.dart';
import 'package:firebase_using_app/folders/home.dart';
import 'package:firebase_using_app/folders/sign.dart';
import 'package:firebase_using_app/folders/update.dart';
import 'package:flutter/material.dart';
import 'package:firebase_using_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase_App',
      routes: {
        '/': (context) => Signin(),
        '/add': (context) => AddUser(),
        '/update' :(context) => Updateuser(),
        '/signin' :(context) => MyHomePage(),
      },
    );
  }
}
