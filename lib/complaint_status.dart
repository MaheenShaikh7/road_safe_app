import 'package:flutter/material.dart';
import 'package:road_safe_app/dashboard.dart';
import 'package:road_safe_app/utils/app_drawer.dart';

class complaint_status extends StatefulWidget {
  const complaint_status({super.key});

  @override
  State<complaint_status> createState() => _complaint_statusState();
}

class _complaint_statusState extends State<complaint_status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Complaint Status"), backgroundColor: Colors.amber),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Complain has been Successfully raised!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              Center(
                child: MaterialButton(
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Return to Home', style: TextStyle(fontSize: 20,),),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );

                    // print('raising complaint');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
