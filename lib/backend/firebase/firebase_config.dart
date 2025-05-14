import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDeG2O8tGV2PTBdps6nbSqbk36TbsqAI2U",
            authDomain: "qrpark-e1ebd.firebaseapp.com",
            projectId: "qrpark-e1ebd",
            storageBucket: "qrpark-e1ebd.firebasestorage.app",
            messagingSenderId: "115848099630",
            appId: "1:115848099630:web:c9de461885b85d89f4acbf",
            measurementId: "G-8HJZM1CLY3"));
  } else {
    await Firebase.initializeApp();
  }
}
