import 'package:flutter/material.dart';
// import 'package:road_safe_app/complaint_status.dart';
// import 'package:road_safe_app/retry_status.dart';
import 'package:road_safe_app/sign_in_page.dart';
// import 'package:road_safe_app/dashboard.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized(); //use to initialize app
  // SharedPreferences prefs =
  // await SharedPreferences.getInstance(); // use to store data
  runApp(MyApp(
      // tokens: prefs.getString('token'), //used to take token from app
      ));
}

class MyApp extends StatelessWidget {
  final tokens;
  const MyApp({Key? key, @required this.tokens}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      // home: (tokens != null && JwtDecoder.isExpired(tokens) == false)
      //     ? const Dashboard()
      //     : SignInPage(),
      home: SignInPage(),
      // home: retry(),
    );
  }
}
