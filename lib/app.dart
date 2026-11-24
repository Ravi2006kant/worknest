import 'package:flutter/material.dart';
import 'package:freelancer_workspace/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Home(),
    );
  }
}
