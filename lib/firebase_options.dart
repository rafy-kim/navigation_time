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
    apiKey: 'AIzaSyDOP_YiRprZvt8nGwqkU1Vwm0f04NUxI7w',
    appId: '1:1078060694051:web:e53a8c636258d9bf1bcf96',
    messagingSenderId: '1078060694051',
    projectId: 'thread-clone-raom',
    authDomain: 'thread-clone-raom.firebaseapp.com',
    storageBucket: 'thread-clone-raom.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeBAgEdXkJFPmPQb2VImI6p7ugCCCMee4',
    appId: '1:1078060694051:android:2344365ff463ac061bcf96',
    messagingSenderId: '1078060694051',
    projectId: 'thread-clone-raom',
    storageBucket: 'thread-clone-raom.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8VE4DscoTOco6g6D7ryVrBIlO4DXIFag',
    appId: '1:1078060694051:ios:58ecc4c4c09e388a1bcf96',
    messagingSenderId: '1078060694051',
    projectId: 'thread-clone-raom',
    storageBucket: 'thread-clone-raom.appspot.com',
    iosBundleId: 'com.example.navigationTime.RunnerTests',
  );

}