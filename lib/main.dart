import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'firebaseoptions.dart';
import 'firstpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
