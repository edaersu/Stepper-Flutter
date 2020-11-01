import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stepper_demo/test_page/test.dart';
import 'package:stepper_demo/test_page/test_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Test(),
    );
  }
}
