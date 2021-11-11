import 'package:app/src/pages/home/home_pages.dart';
import 'package:app/src/pages/home/manu_customer.dart';
import 'package:app/src/pages/login/google.dart';
import 'package:app/src/pages/login/open_login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: manu(),
    );
    //home: GoogleTestPage());
  }
}
