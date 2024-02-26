import 'package:flutter/material.dart';
import 'package:road_safe_app/sign_in_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Sign Up",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Sign Up'),
              )),
          const SizedBox(
            height: 30,
          ),
          Text("Already have an account?"),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
              child: Text('Sign In'),
            ),
          )
        ]),
      )),
    )));
  }
}
