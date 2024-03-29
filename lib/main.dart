import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:road_safe_app/dashboard.dart';
// import 'package:road_safe_app/complaint_status.dart';
// import 'package:road_safe_app/retry_status.dart';
import 'package:road_safe_app/sign_in_page.dart';
// import 'package:road_safe_app/dashboard.dart';
// import 'global.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //use to initialize app
  SharedPreferences prefs =
  await SharedPreferences.getInstance(); // use to store data
  runApp(MyApp(
      token: prefs.getString('token'),
      ));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({ @required this.token, Key? key,}) : super(key: key);

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
      home:(JwtDecoder.isExpired(token)==false)?Dashboard(token: token):SignInPage(),
      // home: retry(),
    );
  }
}
