import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_workspace/component/quickaction_card.dart';

import '../../component/dashboard_card.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  List<IconData> ico = [
    Icons.people_rounded,
    Icons.folder_rounded,
    Icons.receipt_long_rounded,
    Icons.insert_link_rounded,
  ];
  List<String> name = ["Add", "New", "Create", "Add"];
  List<String> down = ["Client", "Project", "Invoice", "Document"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FreelancerWorkspace"),
        actions: [Icon(Icons.notifications), CircleAvatar()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Hello John"),
            Text("Lets get started"),
            Container(
              margin: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
              height: 125,
              width: .infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
                // color: Theme.of(context).colorScheme.primary,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: DashboardCard(title: 'Projects', value: '3'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: DashboardCard(title: 'Clients')),

                  const SizedBox(width: 10),
                  Expanded(
                    child: DashboardCard(
                      title: 'Paid',
                      value:
                          "₹"
                          "12",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Quick Action",
                    style: TextStyle(fontSize: 17, fontWeight: .bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all →",
                      style: TextStyle(fontWeight: .bold, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 2,
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){

                    },
                    child: QuickactionCard(
                      downs: down[index],
                      title: name[index],
                      value: "All client",
                      icon: ico[index],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Upcoming Tasks",
                    style: TextStyle(fontSize: 17, fontWeight: .bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all →",
                      style: TextStyle(fontWeight: .bold, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(),
                    title: Text("Finish website design for the company "),
                    subtitle: Text("Today @ %pm"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
