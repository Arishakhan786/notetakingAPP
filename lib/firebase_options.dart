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
    apiKey: 'AIzaSyBYvtJy7SuUYoEDZJfCNCMqA2DgBLzqkoY',
    appId: '1:703924428105:web:22779ddfe4e7593731ce98',
    messagingSenderId: '703924428105',
    projectId: 'finalprojectforbootcamp',
    authDomain: 'finalprojectforbootcamp.firebaseapp.com',
    storageBucket: 'finalprojectforbootcamp.firebasestorage.app',
    measurementId: 'G-HXXVNZBGZY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnQQtYT8EbGIl_PNpFCn-FAsib8vlUnUA',
    appId: '1:703924428105:android:0e149b2978aca4d231ce98',
    messagingSenderId: '703924428105',
    projectId: 'finalprojectforbootcamp',
    storageBucket: 'finalprojectforbootcamp.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBR0sbeHOA4rxUM5N_j8IhAHNqJVAdYGco',
    appId: '1:703924428105:ios:03b3cb8e107eefb631ce98',
    messagingSenderId: '703924428105',
    projectId: 'finalprojectforbootcamp',
    storageBucket: 'finalprojectforbootcamp.firebasestorage.app',
    iosBundleId: 'com.example.finalProjectForBootcamp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBR0sbeHOA4rxUM5N_j8IhAHNqJVAdYGco',
    appId: '1:703924428105:ios:03b3cb8e107eefb631ce98',
    messagingSenderId: '703924428105',
    projectId: 'finalprojectforbootcamp',
    storageBucket: 'finalprojectforbootcamp.firebasestorage.app',
    iosBundleId: 'com.example.finalProjectForBootcamp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBYvtJy7SuUYoEDZJfCNCMqA2DgBLzqkoY',
    appId: '1:703924428105:web:8ff8e8379c3435ba31ce98',
    messagingSenderId: '703924428105',
    projectId: 'finalprojectforbootcamp',
    authDomain: 'finalprojectforbootcamp.firebaseapp.com',
    storageBucket: 'finalprojectforbootcamp.firebasestorage.app',
    measurementId: 'G-1BYD24WXFD',
  );

}