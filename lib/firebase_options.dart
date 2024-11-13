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
    apiKey: 'AIzaSyA-FlWKNTfuOA5fTEC0KX0brRuhyuQOQvI',
    appId: '1:445713456803:web:95127f1fd5ef719e316916',
    messagingSenderId: '445713456803',
    projectId: 'test-app-6fee2',
    authDomain: 'test-app-6fee2.firebaseapp.com',
    storageBucket: 'test-app-6fee2.appspot.com',
    measurementId: 'G-HNTYE9B77Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-Q59YYuOBLz5RAEm-DySeUtZC3RUWgWg',
    appId: '1:445713456803:android:f30de9bda41a1a14316916',
    messagingSenderId: '445713456803',
    projectId: 'test-app-6fee2',
    storageBucket: 'test-app-6fee2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByPVemXwkT57UghO3bk56Sk8SMltvtCy8',
    appId: '1:445713456803:ios:35a45747f2211445316916',
    messagingSenderId: '445713456803',
    projectId: 'test-app-6fee2',
    storageBucket: 'test-app-6fee2.appspot.com',
    iosBundleId: 'com.example.test',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByPVemXwkT57UghO3bk56Sk8SMltvtCy8',
    appId: '1:445713456803:ios:35a45747f2211445316916',
    messagingSenderId: '445713456803',
    projectId: 'test-app-6fee2',
    storageBucket: 'test-app-6fee2.appspot.com',
    iosBundleId: 'com.example.test',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA-FlWKNTfuOA5fTEC0KX0brRuhyuQOQvI',
    appId: '1:445713456803:web:4610247fe90cfad5316916',
    messagingSenderId: '445713456803',
    projectId: 'test-app-6fee2',
    authDomain: 'test-app-6fee2.firebaseapp.com',
    storageBucket: 'test-app-6fee2.appspot.com',
    measurementId: 'G-GF85E8WJSQ',
  );
}
