import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
        onPressed: () {},
      ),
    );
  }
}
