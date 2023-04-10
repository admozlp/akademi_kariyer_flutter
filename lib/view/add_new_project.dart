import 'package:akademi_kariyer/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import 'my_projects_screen.dart';

class Category {
  int id;
  String name;

  Category({
    this.id = 1,
    this.name = "Flutter",
  });
}

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  TextEditingController baslikController = TextEditingController();
  TextEditingController aciklamaController = TextEditingController();
  Map<String, dynamic> project = <String, dynamic>{};

  @override
  void dispose() {
    super.dispose();
    baslikController.clear();
    aciklamaController.clear();
  }

  static final List<Category> _Categorys = [
    Category(id: 1, name: "Flutter"),
    Category(id: 2, name: "PHP"),
    Category(id: 3, name: "Node.js"),
    Category(id: 4, name: "Angular"),
    Category(id: 5, name: "Pyhton"),
    Category(id: 6, name: "Java"),
    Category(id: 7, name: "Unity"),
    Category(id: 8, name: "MySQL"),
    Category(id: 9, name: "CSS3"),
    Category(id: 10, name: "React"),
    Category(id: 11, name: "GO"),
    Category(id: 12, name: "Rust"),
  ];
  final _items =
      _Categorys.map((Category) => MultiSelectItem(Category, Category.name))
          .toList();

  List<String> selectedCategories = [];
  final formKey = GlobalKey<FormState>();

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
          "Yeni Proje Ekle",
          style: TextStyle(color: academyBlack),
        ),
      ),
      body: Center(
        heightFactor: 2,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 300,
                  child: Text(
                    "Proje adını ve açıklamasını ekle, kullandığın ve kullanacağın teknolojileri seç ve projen aradığın yeteneklere sahip takım arkadaşları ile eşlessin!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: baslikController,
                          decoration: const InputDecoration(
                            label: Text("Proje Başlığı"),
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
                            suffixIcon: Icon(Icons.title),
                            contentPadding: EdgeInsets.all(10),
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
                            project["baslik"] = newValue;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: aciklamaController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: const InputDecoration(
                            label: Text("Proje Açıklaması"),
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
                            contentPadding: EdgeInsets.all(10),
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
                            project["aciklama"] = newValue;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: MultiSelectDialogField(
                          items: _items,
                          title: const Text("Kategoriler"),
                          selectedColor: academyBlue,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2)),
                            border: Border.all(
                              color: academyDGray,
                              width: 2,
                            ),
                          ),
                          buttonIcon: const Icon(
                            Icons.code,
                            color: academyDGray,
                          ),
                          buttonText: const Text(
                            "Proje Kategorileri",
                            style: TextStyle(
                              color: academyDGray,
                              fontSize: 16,
                            ),
                          ),
                          onConfirm: (results) {
                            String cat = "";
                            results.forEach((element) {
                              selectedCategories.add(element.name.toString());
                            });
                            for (int i = 0;
                                i < selectedCategories.length;
                                i++) {
                              cat += '${selectedCategories[i]}, ';
                            }
                            ;
                            project["kategoriler"] = cat;
                          },
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return "Kategori Seçiniz";
                              } else {
                                return null;
                              }
                            } else {
                              return "Null olamaz";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: (() {
                          final icerikUygunMu =
                              formKey.currentState?.validate();
                          if (icerikUygunMu == true) {
                            formKey.currentState?.save();
                            var doc = FirebaseAuth.instance.currentUser?.email;
                            CollectionReference projects = FirebaseFirestore
                                .instance
                                .collection('projects');
                            project['olusturan'] = doc;
                            Future<void> addUser() {
                              return projects
                                  .add(project)
                                  .then((value) => print("Project Added"))
                                  .catchError((error) =>
                                      print("Failed to add porject: $error"));
                            }

                            addUser();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyProjectsScreen()));
                          }
                        }),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            elevation: 0,
                            shape: const StadiumBorder(),
                            backgroundColor: academyYellow),
                        child: const Text(" Projeyi Oluştur"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
