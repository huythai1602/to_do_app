import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/screens/signup_screen.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => prefs = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  48 -
                  MediaQuery.of(context).padding.bottom -
                  MediaQuery.of(context).padding.top,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF919399),
                        ),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    width: 200,
                    margin: const EdgeInsets.only(top: 25),
                    child: const Text(
                      'Hello Again! Welcome back',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Email Address',
                        filled: true,
                        fillColor: const Color(0xFFe7e6f5),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Password",
                        filled: true,
                        fillColor: const Color(0xFFe7e6f5),
                      ),
                      obscureText: true,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: 1000,
                      height: 60,
                      child: TextButton(
                        onPressed: signIn,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF706897)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        child: const Text(
                          'LOG IN',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFe7e6f5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()),
                    ),
                    child: Container(
                      width: 300,
                      margin:
                          const EdgeInsets.only(top: 20, left: 135, right: 130),
                      alignment: Alignment.center,
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFb9b8cd),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    String emailSignin = emailController.text;
    String passwordSignin = passwordController.text;
    await prefs.setString('emailSignin', emailSignin);
    await prefs.setString('passwordSignin', passwordSignin);
    final String emailSignup = prefs.getString('email') ?? '';
    final String passwordSignup = prefs.getString('password') ?? '';
    if (emailSignin == emailSignup && passwordSignin == passwordSignup) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false,
      );
    } else {
      log('Wrong email or password');
    }
  }
}
