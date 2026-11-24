import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_workspace/component/btn.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(children: [
        CircleAvatar(),
        Text("Freelancer"),
        Text("Workspace"),

        SizedBox(height: 10,),
        Text("Your complete freelance"),
        Text("business companion"),
        
Btn(txt: "Get Started",onPress: (){},),
      ],)
    );
  }
}
