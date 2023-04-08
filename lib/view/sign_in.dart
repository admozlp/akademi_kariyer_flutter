// ignore_for_file: use_build_context_synchronously

import 'package:akademi_kariyer/main.dart';
import 'package:akademi_kariyer/view/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailController;
  late TextEditingController passController;
  late User? curentUser;

  @override
  void initState() {
    super.initState();
    curentUser = FirebaseAuth.instance.currentUser;
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return curentUser == null
        ? SafeArea(
            child: Scaffold(
            backgroundColor: Colors.grey.shade900,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        const Text(
                          "Giriş Yap",
                          textScaleFactor: 2,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: const TextStyle(color: Colors.white),
                          controller: passController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passController.text);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const MyHomePage()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('Email yanlış');
                          } else if (e.code == 'wrong-password') {
                            print('Parola Yanlış');
                          }
                        }
                      },
                      child: const Text("Giriş Yap")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                      },
                      child: const Text("Hesabınız yok mu? Kaydol"))
                ],
              ),
            ),
          ))
        : const MyHomePage();
  }
}
