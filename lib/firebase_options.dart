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
    apiKey: 'AIzaSyCpndfj1zSGgslLki9K7O7VQ5odBAbxDhc',
    appId: '1:418943871887:web:7f0c23658521c93e7639fa',
    messagingSenderId: '418943871887',
    projectId: 'one-note-bb1df',
    authDomain: 'one-note-bb1df.firebaseapp.com',
    storageBucket: 'one-note-bb1df.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPe4uOXkyNCrMoAd6moe060IzCE8sf8SI',
    appId: '1:418943871887:android:2c21f1c61b491a777639fa',
    messagingSenderId: '418943871887',
    projectId: 'one-note-bb1df',
    storageBucket: 'one-note-bb1df.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7WFzZenz3apII9FZViihVXGJ8OszEFdM',
    appId: '1:418943871887:ios:b7a5f3b0a9d803f97639fa',
    messagingSenderId: '418943871887',
    projectId: 'one-note-bb1df',
    storageBucket: 'one-note-bb1df.appspot.com',
    iosClientId: '418943871887-5ea67uuti4g4ntcvnrgdlo669i86j92v.apps.googleusercontent.com',
    iosBundleId: 'com.example.oneNoteClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7WFzZenz3apII9FZViihVXGJ8OszEFdM',
    appId: '1:418943871887:ios:b7a5f3b0a9d803f97639fa',
    messagingSenderId: '418943871887',
    projectId: 'one-note-bb1df',
    storageBucket: 'one-note-bb1df.appspot.com',
    iosClientId: '418943871887-5ea67uuti4g4ntcvnrgdlo669i86j92v.apps.googleusercontent.com',
    iosBundleId: 'com.example.oneNoteClone',
  );
}
