import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_using_app/combonents/image.dart';
import 'package:firebase_using_app/combonents/my_button.dart';
import 'package:firebase_using_app/combonents/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);

    if (userCredential.user != null) {
      Navigator.pushNamed(context, '/signin');
    }
  }

  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Icon(
                  Icons.flutter_dash_outlined,
                  size: 100,
                ),
                SizedBox(height: 50),
                Text(
                  'Welcome back you',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                MyTextField(
                  controller: userController,
                  hintText: 'Username',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap: () {},
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Text('or continue with'),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImagePage(
                        onTap: () {
                          signInWithGoogle();
                        },
                        imagePath:
                            'https://w7.pngwing.com/pngs/326/85/png-transparent-google-logo-google-text-trademark-logo.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    ImagePage(
                        onTap: () {},
                        imagePath:
                            'https://image.similarpng.com/very-thumbnail/2020/04/Popular-facebook-Logo-png.png'),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Register Now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Firebase_App'),
    //   ),
    //   body: Center(
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: GestureDetector(
    //         onTap: () {
    //           signInWithgoogle();
    //           Navigator.pushNamed(context, '/signin');
    //         },
    //         child: Container(
    //           width: double.infinity,
    //           height: 45,
    //           decoration: BoxDecoration(
    //             border: Border.all(
    //               color: Colors.grey,
    //             ),
    //             borderRadius: BorderRadius.circular(8),
    //           ),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
    //               child: Image.network('https://w7.pngwing.com/pngs/326/85/png-transparent-google-logo-google-text-trademark-logo.png'),
    //               ),
    //               const Text('Continue with google', style: TextStyle(fontSize: 17),),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
