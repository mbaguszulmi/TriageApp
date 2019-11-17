import 'package:flutter/material.dart';

class CameraScan extends StatefulWidget {
  @override
  _CameraScanState createState() => _CameraScanState();
}

class _CameraScanState extends State<CameraScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Camera Scan')
      )
    );
  }
}