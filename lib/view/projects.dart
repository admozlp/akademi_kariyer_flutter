import 'package:akademi_kariyer/components/drawer/custom_drawer.dart';
import 'package:akademi_kariyer/constants/colors.dart';
import 'package:akademi_kariyer/nav/NavigationMenu.dart';
import 'package:akademi_kariyer/view/project_detail.dart';
import 'package:flutter/material.dart';
import 'package:akademi_kariyer/models/user.dart';
import 'package:akademi_kariyer/models/project.dart';
import 'package:akademi_kariyer/models/Category.dart';
import 'package:akademi_kariyer/models/ProjectCategory.dart';
import 'package:akademi_kariyer/models/UserCategory.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  final List<User> _users = [
    User(
        1,
        'Elliana Palacios',
        'Eşleşme 50%',
        'https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b',
        false),
    User(
        2,
        'Kayley Dwyer',
        'Eşleşme 65%',
        'https://images.unsplash.com/photo-1503467913725-8484b65b0715?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=cf7f82093012c4789841f570933f88e3',
        false),
    User(
        3,
        'Kathleen Mcdonough',
        'Eşleşme 45%',
        'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da',
        false),
    User(
        4,
        'Kathleen Dyer',
        'Eşleşme 80%',
        'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=ddcb7ec744fc63472f2d9e19362aa387',
        false),
    User(
        5,
        'Mikayla Marquez',
        'Eşleşme 68%',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        6,
        'Kiersten Lange',
        'Eşleşme 90%',
        'https://images.unsplash.com/photo-1542534759-05f6c34a9e63?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        7,
        'Carys Metz',
        'Eşleşme 72%',
        'https://images.unsplash.com/photo-1516239482977-b550ba7253f2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        8,
        'Ignacio Schmidt',
        'Eşleşme 92%',
        'https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        9,
        'Clyde Lucas',
        'Eşleşme 73%',
        'https://images.unsplash.com/photo-1569443693539-175ea9f007e8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        10,
        'Mikayla Marquez',
        'Eşleşme 99%',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false)
  ];

  final List<Project> _project = [
    Project(
        1,
        'ToDo App',
        'Bir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir no',
        2),
    Project(
        2,
        'dasdsa App',
        'Bir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir not alma uygulamasBir no',
        5),
    Project(3, 'ddd App', 'Bir not alma uygulaması', 3),
    Project(4, 'ToDo dd', 'Bir not alma uygulaması', 7),
  ];

  final List<Category> _category = [
    Category(1, 'PHP'),
    Category(2, 'HTML'),
    Category(3, 'CSS'),
    Category(4, 'Angular'),
    Category(5, 'Pyhon'),
    Category(6, 'New'),
  ];

  final List<CategoryProject> _categoryproject = [
    CategoryProject(1, 1, 1),
    CategoryProject(2, 1, 3),
    CategoryProject(3, 2, 1),
    CategoryProject(4, 3, 2),
    CategoryProject(5, 4, 3),
    CategoryProject(6, 1, 5),
    CategoryProject(7, 1, 6),
    CategoryProject(8, 1, 6),
  ];
  final List<UserCategory> _usercategory = [
    UserCategory(1, 1, 1),
    UserCategory(2, 1, 3),
    UserCategory(3, 2, 1),
    UserCategory(4, 2, 2),
  ];

  List<User> _foundedUsers = [];
  List<Project> _foundedProjects = [];
  List<Category> _foundedCategory = [];
  List<CategoryProject> _foundedCP = [];
  List<UserCategory> _foundedUC = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _foundedUsers = _users;
      _foundedProjects = _project;
      _foundedCategory = _category;
      _foundedCP = _categoryproject;
      _foundedUC = _usercategory;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
      _foundedProjects = _project
          .where((project) => project.name.toLowerCase().contains(search))
          .toList();
      _foundedCategory = _category
          .where((category) => category.name.toLowerCase().contains(search))
          .toList();
      //_foundedCP=_categoryproject.where((categoryproject)=>categoryproject.name.toLowerCase().contains(search)).toList();;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.network(
              "https://oyunveuygulamaakademisi.com/assets/site/oua/assets/sites/images/homepage-images/homepage_img_8.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        title: Text("Akademi Kariyer"),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      backgroundColor: bgColor,
      bottomNavigationBar: NavigationMenu(size: size),
      body: ListView.builder(
          itemCount: _foundedProjects.length,
          itemBuilder: (context, index) {
            return userComponent(
                project: _foundedProjects[index],
                list: _foundedUsers,
                usercategory: _foundedUC,
                categoryproject: _categoryproject,
                category2: _foundedCategory);
          }),
    );
  }

  userComponent(
      {required Project project,
      required List<User> list,
      required List<UserCategory> usercategory,
      required List<CategoryProject> categoryproject,
      required List<Category> category2}) {
    int suankiuser = 2;
    // int userid=project.userid;
    var newlist = list.firstWhere((id) => id.id == project.userid);
    var projeusername = newlist.name;
    var categoryname = projeler(
        id: project.id, categoryproject: categoryproject, category: category2);
    var yuzde = range(
        suankiuserid: suankiuser,
        projectid: project.id,
        usercategory: usercategory,
        categoryproject: categoryproject);

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
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  //margin:  EdgeInsets.all(8.0),
                  children: [
                    Text(
                      project.name,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      yuzde.toString(),
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
                  margin: EdgeInsets.all(5.0),
                  child: Text(project.comment),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                          child: ListView.builder(
                              itemCount: categoryname.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    categoryname[index].name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProjectDetail(projectid: project.id,yuzde: yuzde,categoryname: categoryname,)));
                        },
                        child: Text(
                          "Daha Fazla",
                          style: TextStyle(color: Colors.white),
                        )),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.blue,
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    projeusername,
                    style: TextStyle(color: Colors.deepOrange),
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

List<Category> projeler(
    {required int id,
    required List<CategoryProject> categoryproject,
    required List<Category> category}) {
  List<Category> categoryname = [];
  var pc = categoryproject.where((element) => element.projectid == id).toList();
  for (var p in pc) {
    categoryname
        .add(category.firstWhere((element) => element.id == p.categoryid));
  }
  return categoryname;
}

String range(
    {required int suankiuserid,
    required int projectid,
    required List<UserCategory> usercategory,
    required List<CategoryProject> categoryproject}) {
  var uc =
      usercategory.where((element) => element.userid == suankiuserid).toList();
  var pc = categoryproject
      .where((element) => element.projectid == projectid)
      .toList();
  int count = 0;

  for (var i in pc) {
    for (var j in uc) {
      if (j.categoryid == i.categoryid) {
        count++;
      }
    }
  }
  var y=((100*count)/pc.length);
  var a=y.ceil();
  var yuzde="%"+a.toString();

  return yuzde;
}

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: Size(40, 30),
  primary: Colors.blue,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);
