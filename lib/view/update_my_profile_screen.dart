import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:akademi_kariyer/constants/colors.dart';
import 'package:get/get.dart';
import '../models/profile.dart';
import 'my_profile_screen.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<Profile?> readProfile() async {
    var doc_id = FirebaseAuth.instance.currentUser?.email;
    final docProfile =
        FirebaseFirestore.instance.collection("profile").doc(doc_id);
    final snapshot = await docProfile.get();
    if (snapshot.exists) {
      return Profile.fromJson(snapshot.data()!);
    } else {
      return Profile(
          adSoyad: "adSoyad",
          emailProfile: "emailProfile",
          githubLink: "githubLink",
          linkedinLink: "linkedinLink",
          profilAciklama: "profilAciklama");
    }
  }

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
        body: FutureBuilder<Profile?>(
          future: readProfile(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Hata var ${snapshot.printError}");
            } else if (snapshot.hasData) {
              final profile = snapshot.data;
              return profile == null
                  ? const Center(
                      child: Text('Profil Yok'),
                    )
                  : PorfileWidget(profile);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

class PorfileWidget extends StatefulWidget {
  Profile gelenp;

  PorfileWidget(this.gelenp, {super.key});

  @override
  State<PorfileWidget> createState() => _PorfileWidgetState();
}

class _PorfileWidgetState extends State<PorfileWidget> {
  Map<String, dynamic> profile = <String, dynamic>{};
  TextEditingController adSoyadController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController linkedin = TextEditingController();
  TextEditingController github = TextEditingController();
  TextEditingController profilAciklama = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    adSoyadController.text = widget.gelenp.adSoyad;
    emailController.text = widget.gelenp.emailProfile;
    linkedin.text = widget.gelenp.linkedinLink;
    github.text = widget.gelenp.githubLink;
    profilAciklama.text = widget.gelenp.profilAciklama;
    print(widget.gelenp.adSoyad);
  }

  @override
  void dispose() {
    super.dispose();
    adSoyadController.clear();
    emailController.clear();
    linkedin.clear();
    github.clear();
    profilAciklama.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              key: formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: adSoyadController,
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
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "Boş bırakılamaz";
                          } else {
                            return null;
                          }
                        } else {
                          return "Null olamaz";
                        }
                      },
                      onSaved: (newValue) {
                        profile["adSoyad"] = newValue;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: emailController,
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
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "Boş bırakılamaz";
                          } else {
                            return null;
                          }
                        } else {
                          return "Null olamaz";
                        }
                      },
                      onSaved: (newValue) {
                        profile["emailProfile"] = newValue;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: linkedin,
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
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "Boş bırakılamaz";
                          } else {
                            return null;
                          }
                        } else {
                          return "Null olamaz";
                        }
                      },
                      onSaved: (newValue) {
                        profile["linkedin"] = newValue;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: github,
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
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "Boş bırakılamaz";
                          } else {
                            return null;
                          }
                        } else {
                          return "Null olamaz";
                        }
                      },
                      onSaved: (newValue) {
                        profile["github"] = newValue;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: profilAciklama,
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
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "Boş bırakılamaz";
                          } else {
                            return null;
                          }
                        } else {
                          return "Null olamaz";
                        }
                      },
                      onSaved: (newValue) {
                        profile["profilAciklama"] = newValue;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // up to firebase
                      final icerikUygunMu = formKey.currentState?.validate();
                      if (icerikUygunMu == true) {
                        formKey.currentState?.save();
                        var doc = FirebaseAuth.instance.currentUser?.email;
                        CollectionReference profiles =
                            FirebaseFirestore.instance.collection('profile');

                        Future<void> addUser() {
                          return profiles
                              .doc(doc)
                              .set(profile)
                              .then((value) => print("Profile Added"))
                              .catchError((error) =>
                                  print("Failed to add profile: $error"));
                        }

                        addUser();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyProfileScreen()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const StadiumBorder(),
                        backgroundColor: academyBlue),
                    child: const Text(" Değişiklikleri Kaydet"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
