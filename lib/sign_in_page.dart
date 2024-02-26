import 'package:flutter/material.dart';
import 'package:road_safe_app/dashboard.dart';
import 'package:road_safe_app/sign_up_page.dart';
// import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordControlle = TextEditingController();
  // bool _isNotValid = false;
  // late SharedPreferences prefs;

  // Future<void> signIn() async {
  //   final response = await http.get(Uri.parse(""));

  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              colors: [Colors.blue, Colors.white])),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign In',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * (0.8),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * (0.8),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Dashboard()));
              },
              child: const Text('Sign In'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text("Don't have an account?"),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
              child: const Text("Sign Up"),
            ),
          )
        ],
      )),
    )));
  }
}
