import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_workspace/component/client_listile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [

// ClientListile(txt: "John Wick",),
          Center(
            child: ListTile(
              leading: Text("Dark Mode"),
              trailing: CupertinoSwitch(value: false, onChanged: (value) {}),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Log Out")),
        ],
      ),
    );
  }
}
