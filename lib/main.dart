import 'package:firebase1/ui/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async{
 WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
   await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyDE-nidhwCBj1eW1MIk94JyROUhQBsrwF0",
        authDomain: "fir-1-5da9e.firebaseapp.com",
        projectId: "fir-1-5da9e",
        storageBucket: "fir-1-5da9e.appspot.com",
        messagingSenderId: "563017252610",
        appId: "1:563017252610:web:0f67cfb17bf4959f2e0c1b",
        measurementId: "G-H9MD79KJ8T"));
  }
  else{
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noman',
      home: SplashScreen(),
    );
  }
}

