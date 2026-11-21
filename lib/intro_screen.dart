import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(decoration: BoxDecoration(
    gradient: LinearGradient(colors: [Colors.red,Colors.blue])

      ),
    ),
    );
  }
}
