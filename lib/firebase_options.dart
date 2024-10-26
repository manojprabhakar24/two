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
    apiKey: 'AIzaSyBrg2KceOGPIjhS8A41gyhBIb0tzk724_I',
    appId: '1:1037082616889:web:3ea37ed09644cb99e899e8',
    messagingSenderId: '1037082616889',
    projectId: 'ecommerce-fd2e0',
    authDomain: 'ecommerce-fd2e0.firebaseapp.com',
    storageBucket: 'ecommerce-fd2e0.appspot.com',
    measurementId: 'G-FNZKJLMTWE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJ13nqhTKQahwMMCQogWEMMOgN1VvTS8M',
    appId: '1:1037082616889:android:877956514f33988ee899e8',
    messagingSenderId: '1037082616889',
    projectId: 'ecommerce-fd2e0',
    storageBucket: 'ecommerce-fd2e0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA2aBqtviOTj0YiYgS75H9HpCgpkacbGw4',
    appId: '1:1037082616889:ios:50f3f70b7420593ce899e8',
    messagingSenderId: '1037082616889',
    projectId: 'ecommerce-fd2e0',
    storageBucket: 'ecommerce-fd2e0.appspot.com',
    iosBundleId: 'com.example.two',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA2aBqtviOTj0YiYgS75H9HpCgpkacbGw4',
    appId: '1:1037082616889:ios:50f3f70b7420593ce899e8',
    messagingSenderId: '1037082616889',
    projectId: 'ecommerce-fd2e0',
    storageBucket: 'ecommerce-fd2e0.appspot.com',
    iosBundleId: 'com.example.two',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBrg2KceOGPIjhS8A41gyhBIb0tzk724_I',
    appId: '1:1037082616889:web:9c2133c5066150c1e899e8',
    messagingSenderId: '1037082616889',
    projectId: 'ecommerce-fd2e0',
    authDomain: 'ecommerce-fd2e0.firebaseapp.com',
    storageBucket: 'ecommerce-fd2e0.appspot.com',
    measurementId: 'G-8847PZQD87',
  );
}
