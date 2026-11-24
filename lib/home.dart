import 'package:flutter/material.dart';
import 'package:freelancer_workspace/pages/home/clients_screen.dart';
import 'package:freelancer_workspace/pages/home/dashboard.dart';
import 'package:freelancer_workspace/pages/home/invoices_screen.dart';
import 'package:freelancer_workspace/pages/home/project_screen.dart';
import 'package:freelancer_workspace/pages/home/settings.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screen = [
    Dashboard(),
    ProjectScreen(),
    ClientsScreen(),  InvoicesScreen(),
    Settings(),
  ];

  int _selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screen[_selectedScreen],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreen,
        unselectedItemColor: Colors.grey ,
       backgroundColor: Colors.green,
        onTap: (value) {
          setState(() {
            _selectedScreen = value;
          });
        },
        fixedColor: Colors.blue,
        items: [

          BottomNavigationBarItem(

            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_file_sharp),
            label: "Projects",
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Clients",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Invoices"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}
