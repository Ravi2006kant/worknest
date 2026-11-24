import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  Btn({super.key,required this.txt,required this.onPress});
  String txt;
  Function()? onPress;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: .infinity,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(Colors.blue),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          // onPressed: isLoading ? null : () async {},
          onPressed: onPress,
          child: isLoading
              ? CircularProgressIndicator()
              : Text(
                  txt,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: .bold,
                    fontSize: 17,
                  ),
                ),
        ),
      ),
    );
  }
}
