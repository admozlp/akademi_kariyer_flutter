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
  final int projectid;
  final String  yuzde;
  final List<Category> categoryname;

  const ProjectDetail({Key? key, required this.projectid,required this.yuzde,required this.categoryname}) : super(key: key);


  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  final List<User> _users = [
    User(1, 'Elliana Palacios', 'Eşleşme 50%',
        'https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b',
        false),
    User(2, 'Kayley Dwyer', 'Eşleşme 65%',
        'https://images.unsplash.com/photo-1503467913725-8484b65b0715?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=cf7f82093012c4789841f570933f88e3',
        false),
    User(3, 'Kathleen Mcdonough', 'Eşleşme 45%',
        'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da',
        false),
    User(4, 'Kathleen Dyer', 'Eşleşme 80%',
        'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=ddcb7ec744fc63472f2d9e19362aa387',
        false),
    User(5, 'Mikayla Marquez', 'Eşleşme 68%',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(6, 'Kiersten Lange', 'Eşleşme 90%',
        'https://images.unsplash.com/photo-1542534759-05f6c34a9e63?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(7, 'Carys Metz', 'Eşleşme 72%',
        'https://images.unsplash.com/photo-1516239482977-b550ba7253f2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(8, 'Ignacio Schmidt', 'Eşleşme 92%',
        'https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(9, 'Clyde Lucas', 'Eşleşme 73%',
        'https://images.unsplash.com/photo-1569443693539-175ea9f007e8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(10, 'Mikayla Marquez', 'Eşleşme 99%',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false)
  ];

  final List<Project> _project=[
    Project(1, 'ToDo App', 'Bir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir no', 2),
    Project(2, 'dasdsa App', 'Bir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir no', 5),
    Project(3, 'ddd App', 'Bir not alma uygulaması', 3),
    Project(4, 'ToDo dd', 'Bir not alma uygulaması', 7),
  ];

  final List<Category> _category =[
    Category(1, 'PHP'),
    Category(2, 'HTML'),
    Category(3, 'CSS'),
    Category(4, 'Angular'),
    Category(5, 'Pyhon'),

  ];

  final List<CategoryProject> _categoryproject=[
    CategoryProject(1, 1, 1),
    CategoryProject(2, 1, 3),
    CategoryProject(3, 2, 1),
    CategoryProject(4, 3, 2),
    CategoryProject(5, 4, 3),
    CategoryProject(6, 1, 5),


  ];
  final List<UserCategory> _usercategory=[
    UserCategory(1, 1, 1),
    UserCategory(2, 1, 3),
    UserCategory(3, 2, 1),
    UserCategory(4, 2, 2),
  ];

  List<User> _foundedUsers = [];
  List<Project> _foundedProjects = [];
  //List<Category> _foundedCategory = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _foundedUsers = _users;
      _foundedProjects=_project;
     // _foundedCategory=_category;


    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var p= _foundedProjects.firstWhere((element) => element.id==widget.projectid);
    var u=_foundedUsers.firstWhere((element) => element.id==p.userid);
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
                  u.image,
                  height: 150,),
                Text(u.name,style:const TextStyle(color: Colors.deepOrange),),
                const SizedBox(height: 14,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    Text(p.name,
                      style: const TextStyle(
                        fontSize:23,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,),
                    ),
                    Text(widget.yuzde,

                      style: const TextStyle(
                        fontSize:18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin:  const EdgeInsets.all(5.0),
                  child:Text(p.comment),
                ),
                const SizedBox(height: 8.0,),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,

                        child: ListView.builder(
                            itemCount:widget.categoryname.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return ElevatedButton(
                                onPressed: () { },
                                child: Text(
                                  widget.categoryname[index].name,
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
