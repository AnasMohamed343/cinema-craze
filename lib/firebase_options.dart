// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyC-JGzPK_-nfj0p9DmTFvldccUeJgtvquc',
    appId: '1:726922867876:web:15a6d831f1fc1c715b6231',
    messagingSenderId: '726922867876',
    projectId: 'cinema-craze-c126b',
    authDomain: 'cinema-craze-c126b.firebaseapp.com',
    storageBucket: 'cinema-craze-c126b.appspot.com',
    measurementId: 'G-KZJ6B0M23P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtI4xgNncVqW0HocR9ssf0YCfg9hnBTvo',
    appId: '1:726922867876:android:e67b4d29447d10685b6231',
    messagingSenderId: '726922867876',
    projectId: 'cinema-craze-c126b',
    storageBucket: 'cinema-craze-c126b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGZyebaNn3p-iQKH6bOoGrLIgecxZV6WA',
    appId: '1:726922867876:ios:5fd2704f7fd1f0e25b6231',
    messagingSenderId: '726922867876',
    projectId: 'cinema-craze-c126b',
    storageBucket: 'cinema-craze-c126b.appspot.com',
    iosBundleId: 'com.example.cinemaCraze',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDGZyebaNn3p-iQKH6bOoGrLIgecxZV6WA',
    appId: '1:726922867876:ios:5fd2704f7fd1f0e25b6231',
    messagingSenderId: '726922867876',
    projectId: 'cinema-craze-c126b',
    storageBucket: 'cinema-craze-c126b.appspot.com',
    iosBundleId: 'com.example.cinemaCraze',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC-JGzPK_-nfj0p9DmTFvldccUeJgtvquc',
    appId: '1:726922867876:web:23377f2298b0de125b6231',
    messagingSenderId: '726922867876',
    projectId: 'cinema-craze-c126b',
    authDomain: 'cinema-craze-c126b.firebaseapp.com',
    storageBucket: 'cinema-craze-c126b.appspot.com',
    measurementId: 'G-YS4M72JHE8',
  );
}
