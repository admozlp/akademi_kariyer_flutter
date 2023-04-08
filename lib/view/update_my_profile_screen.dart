import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:akademi_kariyer/constants/colors.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: academyBlack,
        ),
        centerTitle: true,
        title: const Text(
          "Düzenle",
          style: TextStyle(color: academyBlack),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://t3.ftcdn.net/jpg/02/99/21/98/360_F_299219888_2E7GbJyosu0UwAzSGrpIxS0BrmnTCdo4.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: academyBlue.withOpacity(0.8)),
                      child: const Icon(
                        Icons.camera_alt,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: academyBlue.withOpacity(0.8)),
                      child: const Icon(
                        Icons.image_rounded,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Form(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Adınız Soyadınız"),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                            color: academyBlue,
                          )),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: academyDGray,
                            ),
                          ),
                          suffixIcon: Icon(Icons.person),
                          contentPadding: EdgeInsets.all(20),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 25, minWidth: 50),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Email Adresiniz"),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                            color: academyBlue,
                          )),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: academyDGray,
                            ),
                          ),
                          suffixIcon: Icon(Icons.email_rounded),
                          contentPadding: EdgeInsets.all(20),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 25, minWidth: 50),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("LinkedIn Profiliniz"),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                            color: academyBlue,
                          )),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: academyDGray,
                            ),
                          ),
                          suffixIcon: Icon(Icons.link),
                          contentPadding: EdgeInsets.all(20),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 25, minWidth: 50),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Github Profiliniz"),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                            color: academyBlue,
                          )),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: academyDGray,
                            ),
                          ),
                          suffixIcon: Icon(Icons.link),
                          contentPadding: EdgeInsets.all(20),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 25, minWidth: 50),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Profil Açıklamanız "),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                            color: academyBlue,
                          )),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: academyDGray,
                            ),
                          ),
                          suffixIcon: Icon(Icons.description),
                          contentPadding: EdgeInsets.all(20),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 25, minWidth: 50),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Şifre"),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                            color: academyBlue,
                          )),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: academyDGray,
                            ),
                          ),
                          suffixIcon: Icon(Icons.password),
                          contentPadding: EdgeInsets.all(20),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 25, minWidth: 50),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: (() {}),
                      child: const Text(" Değişiklikleri Kaydet"),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: StadiumBorder(),
                          backgroundColor: academyBlue),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
