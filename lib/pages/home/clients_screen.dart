import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_workspace/component/btn.dart';
import 'package:freelancer_workspace/component/client_listile.dart';
import 'package:freelancer_workspace/component/client_search.dart';
import 'package:freelancer_workspace/component/client_textfield.dart';

class ClientsScreen extends StatefulWidget {
  ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  final name = TextEditingController();

  final email = TextEditingController();

  final phone = TextEditingController();

  final notes = TextEditingController();

  // List<String> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client", style: TextStyle(fontWeight: .bold)),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ClientListile(
              txt: "Client",
              email: "Helo@",
              ico: Icons.eighteen_mp_outlined,
            ),
          ),
          // ClientSearch(),
          //
          // Center(child: Text(data[0])),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
        onPressed: () {
          showModalBottomSheet(

            context: context,
            builder: (builder) {
              return Column(
                children: [
                  Text(
                    "Add Client",
                    style: TextStyle(fontSize: 25, fontWeight: .bold),
                  ),
                  ClientTextfield(txt: "Client Name", ic: 1, cont: name),
                  ClientTextfield(txt: "Email Address", ic: 2, cont: phone),
                  ClientTextfield(
                    txt: "Phone Number (optional)",
                    ic: 2,
                    cont: email,
                  ),
                  ClientTextfield(txt: "Notes (optional)", ic: 2, cont: notes),
                  Btn(
                    txt: "Save Client",
                    onPress: () {
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: .bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   style: ButtonStyle(
                  //     backgroundColor: WidgetStatePropertyAll(
                  //       Theme.of(context).colorScheme.primary,
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     setState(() {});
                  //     Navigator.pop(context);
                  //   },
                  //   child: Text("Save Client"),
                  // ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
