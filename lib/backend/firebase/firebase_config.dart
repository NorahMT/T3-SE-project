import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCLLyFvf24OPzXYMbrHx_KiOz6DNjVOU24",
            authDomain: "braintech-94399.firebaseapp.com",
            projectId: "braintech-94399",
            storageBucket: "braintech-94399.appspot.com",
            messagingSenderId: "428013873222",
            appId: "1:428013873222:web:e4c91af83668ec0ceb0247",
            measurementId: "G-VX0L0H5MMS"));
  } else {
    await Firebase.initializeApp();
  }
}
