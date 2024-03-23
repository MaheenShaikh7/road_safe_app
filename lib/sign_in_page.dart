import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:road_safe_app/dashboard.dart';
import 'package:road_safe_app/sign_up_page.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'config.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
  bool auth = true;

  // Future<void> signIn() async {
  //   final response = await http.get(Uri.parse(""));

  // }

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };
      print(reqBody['email']);
      print(reqBody['password']);

      var response = await http.post(Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));

      var jsonResponse = jsonDecode(response.body);
      // print("__________------__________-------", jsonResponse['status']),

      if (jsonResponse['status']) {
        // var myToken = jsonResponse['token'];
        // prefs.setString('token', myToken);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        print("Something went wrong!");
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

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
              controller: emailController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                errorStyle:
                    TextStyle(color: const Color.fromARGB(255, 19, 18, 18)),
                errorText: _isNotValidate ? "Enter a valid Email" : null,
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
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                errorStyle:
                    TextStyle(color: const Color.fromARGB(255, 19, 18, 18)),
                errorText: _isNotValidate ? "Enter a proper Password?" : null,
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
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => const Dashboard()));
                loginUser();
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
