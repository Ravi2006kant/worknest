import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Set<Bool> selected;
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoices", style: TextStyle(fontWeight: .bold)),
        centerTitle: false,
        actions: [
          IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
            ),
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(children: [
// SegmentedButton(segments: [
//
//   ButtonSegment(label: Text("All"),value: false)
// ], selected:(){
//
// }),
      ],),
    );
  }
}
