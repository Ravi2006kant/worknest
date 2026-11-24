import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String? value; //acutal 4

  const DashboardCard({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value ?? "0",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: .center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: .bold,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
