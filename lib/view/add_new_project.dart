import 'package:akademi_kariyer/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class Category {
  int id;
  String name;

  Category({
    this.id = 1,
    this.name = "Flutter",
  });
}

class AddProjectScreen extends StatefulWidget {
  AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  // ignore: prefer_final_fields
  static List<Category> _Categorys = [
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

  final _multiSelectKey = GlobalKey<FormFieldState>();

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
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
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
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
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
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: MultiSelectDialogField(
                          items: _items,
                          title: Text("Kategoriler"),
                          selectedColor: academyBlue,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.all(Radius.circular(2)),
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
                          onConfirm: (results) {},
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: (() {}),
                        child: const Text(" Projeyi Oluştur"),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15),
                            elevation: 0,
                            shape: StadiumBorder(),
                            backgroundColor: academyYellow),
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
