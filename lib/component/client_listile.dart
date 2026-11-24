import 'package:flutter/material.dart';

class ClientListile extends StatelessWidget {
  ClientListile({super.key, this.email, required this.txt, required this.ico});
  String txt;
  IconData? ico;
  String? email;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: ((context, index) {
        return ListTile(
          leading: CircleAvatar(),
          title: Text(txt),
          subtitle: Text('$email'),
          trailing: InkWell(
            onTap: () {},
            child: Icon(ico ?? Icons.more_vert_rounded),
          ),
        );
      }),
    );
  }
}
