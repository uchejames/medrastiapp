import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDYF1u_95LsdjrOGKxyGgy0oY9AVDnVikA",
            authDomain: "educational-app-lmgxdj.firebaseapp.com",
            projectId: "educational-app-lmgxdj",
            storageBucket: "educational-app-lmgxdj.appspot.com",
            messagingSenderId: "952772230874",
            appId: "1:952772230874:web:9c20b9b80c52c5d9caefe3"));
  } else {
    await Firebase.initializeApp();
  }
}
