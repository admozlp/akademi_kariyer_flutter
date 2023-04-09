import 'package:akademi_kariyer/view/my_projects_screen.dart';
import 'package:akademi_kariyer/view/sign_in.dart';
import 'package:akademi_kariyer/view/update_my_profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:akademi_kariyer/constants/colors.dart';
import 'package:get/get.dart';
import '../models/profile.dart';

class MyProfileScreen extends StatefulWidget {
  MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
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
  void initState() {
    super.initState();
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
          "Profilim",
          style: TextStyle(color: academyBlack),
        ),
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.settings),
            color: academyBlack,
          )
        ],
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
                  : ProfileWid(context, profile);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  SingleChildScrollView ProfileWid(BuildContext context, Profile profile) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
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
                            width: 35,
                            height: 35,
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
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 160,
                  child: Column(
                    children: [
                      Text(
                        profile.adSoyad,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(profile.profilAciklama,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: const TextStyle(
                              color: academyDGray,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 60,
                  child: ElevatedButton(
                      onPressed: (() {
                        _navigateToNextScreen(context);
                      }),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: academyBlue,
                          side: BorderSide.none,
                          elevation: 0,
                          shape: const CircleBorder()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.edit,
                            color: academyBlack,
                            size: 20,
                          )
                        ],
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(), // menu starts here
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Wrap(
                spacing: 10,
                children: const [
                  Chip(
                    label: Text('Angular'),
                    avatar: FaIcon(FontAwesomeIcons.angular),
                    backgroundColor: Color.fromARGB(255, 240, 96, 86),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  Chip(
                    label: Text('React'),
                    avatar: FaIcon(FontAwesomeIcons.react),
                    backgroundColor: Color.fromARGB(255, 124, 172, 255),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  Chip(
                    label: Text('Node.js'),
                    avatar: FaIcon(FontAwesomeIcons.nodeJs),
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  Chip(
                    label: Text('HTML5'),
                    avatar: FaIcon(FontAwesomeIcons.html5),
                    backgroundColor: Color.fromARGB(255, 255, 140, 64),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  Chip(
                    label: Text('CSS'),
                    avatar: FaIcon(FontAwesomeIcons.css3),
                    backgroundColor: Color.fromARGB(255, 28, 153, 255),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  Chip(
                    label: Text('MySQL'),
                    avatar: FaIcon(FontAwesomeIcons.database),
                    backgroundColor: Colors.grey,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            MenuItem(
                itemTitle: "Sohbet",
                itemIcon: Icons.chat_bubble,
                itemPressed: () {}),
            MenuItem(
                itemTitle: "Projelerim",
                itemIcon: Icons.file_copy_rounded,
                itemPressed: () {}),
            MenuItem(
                itemTitle: "Becerilerim",
                itemIcon: Icons.pan_tool_rounded,
                itemPressed: () {}),
            MenuItem(
                itemTitle: "Eşleşmeler",
                itemIcon: Icons.people_alt_sharp,
                itemPressed: () {}),
            const SizedBox(
              height: 30,
            ),
            Divider(),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: (() async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              }),
              child: const Text("Çıkış Yap"),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: StadiumBorder(),
                  backgroundColor: academyRed),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.itemTitle,
    required this.itemIcon,
    required this.itemPressed,
    this.itemColor,
  }) : super(key: key);

  final String itemTitle;
  final IconData itemIcon;
  final VoidCallback itemPressed;
  final Color? itemColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: ListTile(
        onTap: itemPressed,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: academyDGray.withOpacity(0.1)),
          child: Icon(itemIcon),
        ),
        title: Text(
          itemTitle,
          style: Theme.of(context).textTheme.bodyText1?.apply(color: itemColor),
        ),
        trailing: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: academyBlue.withOpacity(0.2)),
          child: const Icon(
            Icons.chevron_right_sharp,
          ),
        ),
      ),
    );
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => UpdateProfileScreen()));
}
