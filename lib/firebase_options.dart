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
    apiKey: 'AIzaSyCFfZmwN0l1dzxwf4TMB5EuNQtKz6AN-pQ',
    appId: '1:258607022248:web:54ad851e83b278dd4b029d',
    messagingSenderId: '258607022248',
    projectId: 'cours-flutter-ipssi',
    authDomain: 'cours-flutter-ipssi.firebaseapp.com',
    storageBucket: 'cours-flutter-ipssi.appspot.com',
    measurementId: 'G-QXX7WE2VQ9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVlAtTmCE3RM13bNYKPXFwyUiW1Cah2iw',
    appId: '1:258607022248:android:20ec978d2234967a4b029d',
    messagingSenderId: '258607022248',
    projectId: 'cours-flutter-ipssi',
    storageBucket: 'cours-flutter-ipssi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBnnxqmEUS6630k_M3-hbMv8g9rBIkIWR8',
    appId: '1:258607022248:ios:11102267eefaded64b029d',
    messagingSenderId: '258607022248',
    projectId: 'cours-flutter-ipssi',
    storageBucket: 'cours-flutter-ipssi.appspot.com',
    iosClientId: '258607022248-r5dc94tv7m7pcp4qc8f8d4o3lsd6cosr.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstbd233',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBnnxqmEUS6630k_M3-hbMv8g9rBIkIWR8',
    appId: '1:258607022248:ios:0ec03f6c509197e84b029d',
    messagingSenderId: '258607022248',
    projectId: 'cours-flutter-ipssi',
    storageBucket: 'cours-flutter-ipssi.appspot.com',
    iosClientId: '258607022248-44b2ktunogee6a62lvgvubcvq8epm1a8.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstbd233.RunnerTests',
  );
}
