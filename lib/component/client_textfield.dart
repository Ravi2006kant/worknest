import 'package:flutter/material.dart';

class ClientTextfield extends StatelessWidget {
  ClientTextfield({
    super.key,
    required this.txt,
    required this.ic,
    required this.cont,
  });
  String txt;
  int ic;
  final cont;
  IconData ico(int ic) {
    switch (ic) {
      case 1:
        return Icons.person_outline_rounded;
      case 2:
        return Icons.email_outlined;
      case 3:
        return Icons.phone;
      case 4:
        return Icons.receipt_rounded;
      default:
        return Icons.favorite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        controller: cont,
        decoration: InputDecoration(
          hint: Text(txt),
          prefixIcon: Icon(ico(ic)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
