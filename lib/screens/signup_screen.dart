import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/screens/login_screen.dart';
import '../widgets/text_field_custom.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => prefs = value);
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: SingleChildScrollView(
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
                  width: 190,
                  margin: const EdgeInsets.only(top: 25, bottom: 30),
                  child: const Text(
                    'Hello! Signup to get started',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFieldCustom(
                    hintText: 'Enter your name', controller: nameController),
                TextFieldCustom(
                    hintText: 'Enter your email address',
                    controller: emailController),
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
                  margin: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 1000,
                    height: 60,
                    child: TextButton(
                      onPressed: () {},
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
                      child: TextButton(
                        onPressed: signUp,
                        child: const Text(
                          'GET STARTED',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFe7e6f5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, left: 30),
                      child: const Text(
                        'ALREADY HAVE AN ACCOUNT?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFdcdcdd),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      ),
                      child: Container(
                        width: 60,
                        margin: const EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          'LOG IN',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFb0adc9),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    log(name);
    log(email);
    log(password);
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }
}
