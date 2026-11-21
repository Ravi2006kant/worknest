import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FreelancerWorkspace"),
        actions: [CircleAvatar(),Icon(Icons.notifications)],
      ),
    );
  }
}
