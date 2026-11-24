import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickactionCard extends StatelessWidget {
  final String title;
  final String downs;
  final String value;
  final IconData icon;

  const QuickactionCard({
    super.key,

    required this.title,
    required this.value,
    required this.icon,
    required this.downs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsetsGeometry.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: .center,

        children: [
          Icon(icon, size: 30,color: Colors.blue,), SizedBox(height: 5),

          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            downs,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          // const SizedBox(height: 12),
          //
          // Row(mainAxisAlignment: .center, children: [
          //   Text(title,style: TextStyle(fontWeight: .bold,color: Colors.white,fontSize: 15),),
          // ],)
        ],
      ),
    );
  }
}
