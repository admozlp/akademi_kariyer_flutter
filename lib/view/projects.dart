import 'package:akademi_kariyer/components/drawer/custom_drawer.dart';
import 'package:akademi_kariyer/constants/colors.dart';
import 'package:akademi_kariyer/nav/NavigationMenu.dart';
import 'package:akademi_kariyer/view/project_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/proje.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  Stream<List<Proje>> readProject() => FirebaseFirestore.instance
      .collection("projects")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Proje.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(
              "https://oyunveuygulamaakademisi.com/assets/site/oua/assets/sites/images/homepage-images/homepage_img_8.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        title: const Text("Akademi Kariyer"),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      backgroundColor: bgColor,
      bottomNavigationBar: NavigationMenu(size: size),
      body: StreamBuilder<List<Proje>>(
        stream: readProject(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Hata");
          } else if (snapshot.hasData) {
            final projects = snapshot.data!;
            if (projects.isEmpty) {
              return const Center(
                child: Text("Henüz Proje Oluşturulmadı"),
              );
            }
            return ListView.builder(
                itemCount: projects.toList().length,
                itemBuilder: (context, index) => userComponent(
                      project: projects.toList()[index],
                    ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  userComponent({required Proje project}) {
    List<String> kategoriler = project.kategoreiler.split(",");
    kategoriler.removeAt(kategoriler.length-1);
    


    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      project.baslik,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const Text(
                      "72%",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.all(5.0),
                  child: Text(project.aciklama),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                        child: ListView.builder(
                            itemCount: kategoriler.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ElevatedButton(
                                onPressed: () {},
                                child:  Text(
                                  kategoriler[index],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: buttonPrimary,
                        onPressed: () {
                          // go to detay
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectDetail(project)));
                        },
                        child: const Text(
                          "Daha Fazla",
                          style: TextStyle(color: Colors.white),
                        )),
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.blue,
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    project.olusturan,
                    style: const TextStyle(color: Colors.deepOrange),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: const Size(40, 30),
  backgroundColor: Colors.blue,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);
