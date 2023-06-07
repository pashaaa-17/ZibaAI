import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBWUiO0TpuiLWfbdcrjsmVBzx9F025ZHNM",
            authDomain: "ziba-a320a.firebaseapp.com",
            projectId: "ziba-a320a",
            storageBucket: "ziba-a320a.appspot.com",
            messagingSenderId: "335704827005",
            appId: "1:335704827005:web:843020e421b3abda2bbd14",
            measurementId: "G-G23XYZ1GLG"));
  } else {
    await Firebase.initializeApp();
  }
}
