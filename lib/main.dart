import 'package:flutter/material.dart';
import './ui/pages/home.dart';

void main() => runApp(IRememberApp());

class IRememberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IRemember',
      theme: ThemeData(primaryColor: Colors.deepOrange),
      routes: {
        "/": (_) => HomePage(),
      },
    );
  }
}
