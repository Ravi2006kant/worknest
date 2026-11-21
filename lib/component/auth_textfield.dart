import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextfield extends StatefulWidget {
  AuthTextfield({
    super.key,
    required this.cont,
    required this.hint,
    required this.ico,
    required this.validators,
    this.ob = false,
  });
  bool ob;
  final hint;
  final cont;
  int ico;
  String? Function(String?)? validators;

  @override
  State<AuthTextfield> createState() => _AuthTextfieldState();
}

class _AuthTextfieldState extends State<AuthTextfield> {
  String? Function(String?)? val;
  bool isPasswordVisible = false;
  Icon get iconPut {
    switch (widget.ico) {
      case 0:
        return Icon(Icons.person);
      case 1:
        return Icon(Icons.email_outlined);
      case 2:
        return Icon(Icons.lock_outline_rounded);
      default:
        return Icon(Icons.nat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: widget.ob ? !isPasswordVisible : false,
        // keyboardType: .emailAddress,
        controller: widget.cont,
        validator: widget.validators,
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: iconPut,
          suffixIcon: widget.ob
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
