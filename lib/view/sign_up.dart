// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController passTekrarController;
  late TextEditingController uuidController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
    passTekrarController = TextEditingController();
    uuidController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    const Text(
                      "Hesap Oluştur",
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
                        labelText: 'Parola',
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
                      controller: passTekrarController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        labelText: 'Parola tekrar',
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: uuidController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.key),
                        border: OutlineInputBorder(),
                        labelText: 'UUID',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    bool check = false;
                    try {
                      if (validateField()) {
                        CollectionReference emails =
                            FirebaseFirestore.instance.collection('email-uuid');
                        try {
                          var doc = emails.doc(uuidController.text).get();
                          doc.then(
                            (value) {
                              if (value.exists) {
                                check = true;
                              }
                            },
                          ).catchError((onError) {
                            print(onError);
                            check = false;
                          }).whenComplete(() async {
                            if (check) {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passController.text,
                              );
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyHomePage()));
                            }
                          });
                        } catch (e) {
                          print(e);
                        }
                      } else {}
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text("Kaydol"))
            ],
          ),
        ),
      ),
    ));
  }

  bool validateField() {
    var email = emailController.text;
    var pass = passController.text;
    var passTekrar = passTekrarController.text;
    var uuid = uuidController.text;
    bool check = false;
    if (email != "" && pass.length > 3 && pass == passTekrar && uuid != "") {
      return true;
    } else {
      return false;
    }
  }
}
