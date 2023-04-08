// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:akademi_kariyer/constants/colors.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avatar_stack/avatar_stack.dart';

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
          "Projelerim",
          style: TextStyle(color: academyBlack),
        ),
      ),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                ),
                MyProject(),
              ],
            ))
          ]),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: StadiumBorder(),
                      backgroundColor: academyYellow),
                  child: Text(
                    "Yeni Proje Ekle",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class MyProject extends StatelessWidget {
  const MyProject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 3,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ToDo App",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ElevatedButton(
                    onPressed: () {},
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
                    ))
              ],
            ),
            const Divider(
              indent: 5,
              color: academyRed,
            ),
            Container(
              child: Wrap(
                spacing: 3,
                children: const [
                  Chip(
                    label: Text(
                      'Angular',
                      style: TextStyle(fontSize: 12),
                    ),
                    avatar: FaIcon(
                      FontAwesomeIcons.angular,
                      size: 20,
                    ),
                    backgroundColor: Color.fromARGB(255, 240, 96, 86),
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  ),
                  Chip(
                    label: Text(
                      'Node.js',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    avatar: FaIcon(
                      FontAwesomeIcons.nodeJs,
                      size: 20,
                    ),
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  Chip(
                    label: Text(
                      'Cloud',
                      style: TextStyle(fontSize: 12),
                    ),
                    avatar: FaIcon(
                      FontAwesomeIcons.cloud,
                      size: 20,
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 140, 64),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Text(
                    "Microsoft To Do Microsoft tarafından sunulan bulut tabanlı bir görev yönetimi uygulamasıdır. Kullanıcıların görevlerini bir akıllı telefon, tablet ve bilgisayardan yönetmelerine olanak tanır. ")
              ],
            ),
            const Divider(
              indent: 5,
              color: academyGreen,
            ),
            Column(
              children: [
                Text(
                  "Beğeniler",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 5,
                ),
                AvatarStack(
                  settings: RestrictedAmountPositions(
                    maxAmountItems: 6,
                    maxCoverage: 0.3,
                    minCoverage: 0.1,
                    align: StackAlign.center,
                  ),
                  borderColor: Colors.transparent,
                  height: 40,
                  avatars: [
                    for (var n = 50; n < 80; n++)
                      NetworkImage('https://i.pravatar.cc/150?img=$n'),
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
