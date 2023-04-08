import 'package:akademi_kariyer/constants/colors.dart';
import 'package:flutter/material.dart';

class MyProjectsScreen extends StatelessWidget {
  const MyProjectsScreen({super.key});

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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    "Proje Listem",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ))
          ]),
        ),
      ),
    );
  }
}
