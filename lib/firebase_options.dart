// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart';
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
        return windows;
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
    apiKey: 'AIzaSyCis1aPRqoFcrvLK6oOhDUp0rX5XCG4tOI',
    appId: '1:3833295133:web:ca9144fe41c1afc5de31f4',
    messagingSenderId: '3833295133',
    projectId: 'easeup-on',
    authDomain: 'easeup-on.firebaseapp.com',
    storageBucket: 'easeup-on.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOhWKV2QqG1f3KWGEISCodEFV_RWPxhW4',
    appId: '1:3833295133:android:720b619b22f2ea49de31f4',
    messagingSenderId: '3833295133',
    projectId: 'easeup-on',
    storageBucket: 'easeup-on.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJF1vTAU1Poszhu9fQ5izdWddBcsXo4qI',
    appId: '1:3833295133:ios:0036140841ade08cde31f4',
    messagingSenderId: '3833295133',
    projectId: 'easeup-on',
    storageBucket: 'easeup-on.appspot.com',
    iosBundleId: 'com.example.easeup',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJF1vTAU1Poszhu9fQ5izdWddBcsXo4qI',
    appId: '1:3833295133:ios:0036140841ade08cde31f4',
    messagingSenderId: '3833295133',
    projectId: 'easeup-on',
    storageBucket: 'easeup-on.appspot.com',
    iosBundleId: 'com.example.easeup',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCis1aPRqoFcrvLK6oOhDUp0rX5XCG4tOI',
    appId: '1:3833295133:web:d1043bb6008615e3de31f4',
    messagingSenderId: '3833295133',
    projectId: 'easeup-on',
    authDomain: 'easeup-on.firebaseapp.com',
    storageBucket: 'easeup-on.appspot.com',
  );
}
