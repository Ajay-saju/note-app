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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAD6x8AWH5VTlD3qFAGTCaW3jh9THtb_Pg',
    appId: '1:65041293921:web:160a47e61d0c6e84c80020',
    messagingSenderId: '65041293921',
    projectId: 'note-app-efc52',
    authDomain: 'note-app-efc52.firebaseapp.com',
    storageBucket: 'note-app-efc52.appspot.com',
    measurementId: 'G-MS9B3DMMCR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVp50eUroha7f2FchSH2ZOCWWlrpENieI',
    appId: '1:65041293921:android:231741995e957abcc80020',
    messagingSenderId: '65041293921',
    projectId: 'note-app-efc52',
    storageBucket: 'note-app-efc52.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAH1iqwvl-z3RTSEio6MndETq3-2vbVSOQ',
    appId: '1:65041293921:ios:19fb9fdf0d69a987c80020',
    messagingSenderId: '65041293921',
    projectId: 'note-app-efc52',
    storageBucket: 'note-app-efc52.appspot.com',
    iosClientId: '65041293921-hgjchvasa6mmofmf3ui6tok4s1gqomtf.apps.googleusercontent.com',
    iosBundleId: 'com.example.ddd',
  );
}
