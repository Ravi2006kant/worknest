import 'package:flutter/material.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [

ChoiceChip(label: Text("Helo",style: TextStyle(color: Colors.red),), selected: false),

          ],
        ),
      ),
    );
  }
}
