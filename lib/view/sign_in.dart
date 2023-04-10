// ignore_for_file: use_build_context_synchronously

import 'package:akademi_kariyer/constants/colors.dart';
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
    if (curentUser == null) {
      return SafeArea(
            child: Scaffold(
            backgroundColor: bgColor,
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          const SizedBox(height: 48.0),
                          const Image(
                            image: NetworkImage(
                                "https://oyunveuygulamaakademisi.com/assets/site/oua/assets/sites/images/homepage-images/homepage_img_8.png"),
                            height: 72.0,
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Akademi Kariyer',
                            style: TextStyle(
                              color: academyBlack,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 48.0),
                          const Divider(
                            color: academyBlue,
                            thickness: 2,
                          ),
                          const SizedBox(height: 48.0),
                          const Text(
                            "Giriş Yap",
                            textScaleFactor: 1.5,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: const TextStyle(color: academyBlack),
                            controller: emailController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(),
                              labelText: 'E-Posta',
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            style: const TextStyle(color: academyBlack),
                            controller: passController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(),
                              labelText: 'Şifre',
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.all(15),
                            shape: const StadiumBorder(),
                            backgroundColor: academyYellow),
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
                        child: const Text(
                          "Giriş Yap",
                          style: TextStyle(color: academyBlack),
                        )),
                    const SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Handle login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(210, 66, 131, 241),
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 16.0,
                        ),
                      ),
                      child: const Text('Google ile Devam Et'),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                          "Hesabınız yok mu? Kaydol",
                          style: TextStyle(color: academyDGray),
                        ))
                  ],
                ),
              ),
            ),
          ));
    } else {
      return const MyHomePage();
    }
  }
}
