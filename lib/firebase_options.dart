// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDpKHe65qW0IDErKYRnj1HWcRoodL75kSU',
    appId: '1:384511323142:web:d3d01532ace9448bdae787',
    messagingSenderId: '384511323142',
    projectId: 'authfirebasesignin-ac872',
    authDomain: 'authfirebasesignin-ac872.firebaseapp.com',
    storageBucket: 'authfirebasesignin-ac872.appspot.com',
    measurementId: 'G-15E9SXQ7F8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFnGvmgUpgnmL5YXzKBZcixiIOQe10bxU',
    appId: '1:384511323142:android:21627e92f199b2d7dae787',
    messagingSenderId: '384511323142',
    projectId: 'authfirebasesignin-ac872',
    storageBucket: 'authfirebasesignin-ac872.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCoXnKFyERNwy_yWq11XdCRIgLuUAT7NMg',
    appId: '1:384511323142:ios:73ca3c3f0ace9effdae787',
    messagingSenderId: '384511323142',
    projectId: 'authfirebasesignin-ac872',
    storageBucket: 'authfirebasesignin-ac872.appspot.com',
    iosBundleId: 'com.example.firebaseUsingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCoXnKFyERNwy_yWq11XdCRIgLuUAT7NMg',
    appId: '1:384511323142:ios:8978042f1de300cddae787',
    messagingSenderId: '384511323142',
    projectId: 'authfirebasesignin-ac872',
    storageBucket: 'authfirebasesignin-ac872.appspot.com',
    iosBundleId: 'com.example.firebaseUsingApp.RunnerTests',
  );
}
