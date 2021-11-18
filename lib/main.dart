import 'package:app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


//mint is test
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
