import 'package:flutter/material.dart';
import 'package:road_safe_app/utils/app_drawer.dart';
import 'package:road_safe_app/utils/complaints.dart';

class AllComplaints extends StatefulWidget {
  const AllComplaints({super.key});

  @override
  State<AllComplaints> createState() => _AllComplaintsState();
}

class _AllComplaintsState extends State<AllComplaints> {
  int _totalComplaints = 5;
  int _resolvedComplaints = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Complaints'),
          backgroundColor: Colors.amber,
        ),
        drawer: const AppDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              'Total Complaints Registered:  $_totalComplaints',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Total Complaints Resolved: $_resolvedComplaints',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.black,
              height: 20, // Adjust the height of the line
            ),
            const Column(
              children: [
                Text("Id : 1"),
                // SizedBox(
                //   height: 10,
                // ),
                Text("Status : pending"),
                // SizedBox(
                //   height: 10,
                // ),
                Text("location : road"),
                // SizedBox(
                //   height: 10,
                // ),
              ],
            )
          ]),
        ));
  }
}
