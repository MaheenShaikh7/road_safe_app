import 'package:flutter/material.dart';

class Complaint extends StatefulWidget {
  int id;
  String status;
  String location;
  Complaint(
      {super.key,
      required this.id,
      required this.location,
      required this.status});

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("Id : ${widget.id}"),
        // SizedBox(
        //   height: 10,
        // ),
        Text("Status : ${widget.status}"),
        // SizedBox(
        //   height: 10,
        // ),
        Text("location : ${widget.location}"),
        // SizedBox(
        //   height: 10,
        // ),
      ],
    ));
  }
}
