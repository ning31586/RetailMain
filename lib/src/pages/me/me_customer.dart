import 'package:flutter/material.dart';
import 'package:app/src/pages/login/google.dart';

class me extends StatefulWidget {
  // const me({Key? key}) : super(key: key);

  @override
  _meState createState() => _meState();
}

class _meState extends State<me> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [GoogleTestPage()],
      ),
    );
  }
}
