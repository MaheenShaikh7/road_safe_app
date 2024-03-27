import 'package:flutter/material.dart';
import 'package:road_safe_app/dashboard.dart';
import 'package:road_safe_app/utils/app_drawer.dart';
import 'global.dart';

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
                "Your Complaint has been raised Successfully!",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: MaterialButton(
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Return to Home',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    // var myToken =
                    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWY0MWNmYmJjZmQ4YmE2ZTFhNDk0NTkiLCJlbWFpbCI6Inh5ekBnbWFpbC5jb20iLCJpYXQiOjE3MTE1Njg0MTQsImV4cCI6MTcxMTU3MjAxNH0.KuQ1FnATy9iAv4B9NKev9xA8rVuCReEIHn5epXFnmCg";
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboard(
                                token: myToken,
                              )),
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
