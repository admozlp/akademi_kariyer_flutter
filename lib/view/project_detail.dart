import 'package:akademi_kariyer/models/proje.dart';
import 'package:flutter/material.dart';
import 'package:akademi_kariyer/models/user.dart';
import 'package:akademi_kariyer/models/project.dart';
import 'package:akademi_kariyer/models/Category.dart';
import 'package:akademi_kariyer/models/ProjectCategory.dart';
import 'package:akademi_kariyer/models/UserCategory.dart';
import '../components/drawer/custom_drawer.dart';
import '../constants/colors.dart';
import '../nav/NavigationMenu.dart';

class ProjectDetail extends StatefulWidget {
  final Proje project;
  const ProjectDetail(this.project, {Key? key}) : super(key: key);


  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    List<String> kategoriler = widget.project.kategoreiler.split(",");
    kategoriler.removeAt(kategoriler.length-1);
    return Scaffold(
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
          "Proje Detay",
          style: TextStyle(color: academyBlack),
        ),

      ),
      drawer: const CustomDrawer(),
      backgroundColor: bgColor,
      bottomNavigationBar: NavigationMenu(size: size),
      body:Center(
        child: Container(
          width: 350,
          height: 365,
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0,3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(

              children: [
                const SizedBox(height: 14,),
                Image.network(
                  "https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b",
                  height: 150,),
                Text(widget.project.olusturan,style:const TextStyle(color: Colors.deepOrange),),
                const SizedBox(height: 14,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    Text(widget.project.baslik,
                      style: const TextStyle(
                        fontSize:23,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,),
                    ),
                    const Text("72%",
                      style: TextStyle(
                        fontSize:18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin:  const EdgeInsets.all(5.0),
                  child:Text(widget.project.aciklama),
                ),
                const SizedBox(height: 8.0,),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,

                        child: ListView.builder(
                            itemCount:kategoriler.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return ElevatedButton(
                                onPressed: () { },
                                child: Text(
                                  kategoriler[index],
                                  style: const TextStyle(color: Colors.white),
                                ),

                              );

                            }
                        ),

                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8.0,),



              ],
            ),
          ),
        ),

      ),

    );
  }

  projeler({required int projeid,required List<Project> project}){
    var p= project.firstWhere((element) => element.id==projeid);
    return p;

  }
}
