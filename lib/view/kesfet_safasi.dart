import 'package:akademi_kariyer/constants/colors.dart';
import 'package:akademi_kariyer/models/userk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'kesfet_detail.dart';

class Kesfet extends StatefulWidget {
  const Kesfet({Key? key}) : super(key: key);

  @override
  State<Kesfet> createState() => _KesfetState();
}

class _KesfetState extends State<Kesfet> {
  final List<UserK> _users = [
    UserK(
        'Şennur	Ağnar',
        'Eşleşme 50%',
        'https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b',
        false,
        "Merhaba, ben Oyun ve Uygulama Akademisi'nden Can. 2 yıldır mobil uygulama geliştirme ile ilgileniyorum. Flutter konusunda bilgiliyim, Backend tarafında bilgili arkadaşlarla beraber ilerleyebiliriz.",
        "Flutter Developer"),
    UserK(
        'Ayşen	Aksoy',
        'Eşleşme 65%',
        'https://images.unsplash.com/photo-1503467913725-8484b65b0715?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=cf7f82093012c4789841f570933f88e3',
        false,
        "Merhaba, ben Oyun ve Uygulama Akademisi'nden Can. 2 yıldır mobil uygulama geliştirme ile ilgileniyorum. Flutter konusunda bilgiliyim, Backend tarafında bilgili arkadaşlarla beraber ilerleyebiliriz.",
        "Frontend Developer"),
    UserK(
        'Kutlu	Alibeyoğlu',
        'Eşleşme 45%',
        'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da',
        false,
        "Merhaba, ben Oyun ve Uygulama Akademisi'nden Can. 2 yıldır mobil uygulama geliştirme ile ilgileniyorum. Flutter konusunda bilgiliyim, Backend tarafında bilgili arkadaşlarla beraber ilerleyebiliriz.",
        "Cyber Security Expert"),
    UserK(
        'Memet Ali	Ardıç',
        'Eşleşme 80%',
        'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=ddcb7ec744fc63472f2d9e19362aa387',
        false,
        "Merhaba, ben Oyun ve Uygulama Akademisi'nden Can. 2 yıldır mobil uygulama geliştirme ile ilgileniyorum. Flutter konusunda bilgiliyim, Backend tarafında bilgili arkadaşlarla beraber ilerleyebiliriz.",
        "Machine Learning"),
    UserK(
        'Deniz Dilay',
        'Eşleşme 68%',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false,
        "Merhaba, ben Oyun ve Uygulama Akademisi'nden Can. 2 yıldır mobil uygulama geliştirme ile ilgileniyorum. Flutter konusunda bilgiliyim, Backend tarafında bilgili arkadaşlarla beraber ilerleyebiliriz.",
        "Full Stack Developer"),
    UserK(
        'Firuze	Güzel',
        'Eşleşme 90%',
        'https://images.unsplash.com/photo-1542534759-05f6c34a9e63?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false,
        "Merhaba, ben Oyun ve Uygulama Akademisi'nden Can. 2 yıldır mobil uygulama geliştirme ile ilgileniyorum. Flutter konusunda bilgiliyim, Backend tarafında bilgili arkadaşlarla beraber ilerleyebiliriz.",
        "Swift Developer"),
    UserK(
        'Burç	Erbil',
        'Eşleşme 72%',
        'https://images.unsplash.com/photo-1516239482977-b550ba7253f2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false,
        "Merhaba, ben Oyun ve Uygulama Akademisi'nden Can. 2 yıldır mobil uygulama geliştirme ile ilgileniyorum. Flutter konusunda bilgiliyim, Backend tarafında bilgili arkadaşlarla beraber ilerleyebiliriz.",
        "DevOps"),
    UserK(
        'Berker	Akkiray',
        'Eşleşme 92%',
        'https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false,
        "Merhaba, ben Oyun ve Uygulama Akademisi'nden Can. 2 yıldır mobil uygulama geliştirme ile ilgileniyorum. Flutter konusunda bilgiliyim, Backend tarafında bilgili arkadaşlarla beraber ilerleyebiliriz.",
        "Java Script"),
    UserK(
        'Ata Kerem Akman',
        'Eşleşme 73%',
        'https://images.unsplash.com/photo-1569443693539-175ea9f007e8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false,
        "Merhaba, ben Oyun ve Uygulama Akademisi'nden Can. 2 yıldır mobil uygulama geliştirme ile ilgileniyorum. Flutter konusunda bilgiliyim, Backend tarafında bilgili arkadaşlarla beraber ilerleyebiliriz.",
        "React"),
    UserK(
        'Pekcan	Aksöz',
        'Eşleşme 99%',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false,
        "Merhaba, ben Oyun ve Uygulama Akademisi'nden Can. 2 yıldır mobil uygulama geliştirme ile ilgileniyorum. Flutter konusunda bilgiliyim, Backend tarafında bilgili arkadaşlarla beraber ilerleyebiliriz.",
        "Angular")
  ];
  List<UserK> _foundedUsers = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.adSoyad.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        title: SizedBox(
          height: 38,
          child: TextField(
            style: const TextStyle(color: Colors.black),
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: academyGray,
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: const Icon(
                  Icons.search,
                  color: academyBlack,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                hintStyle: const TextStyle(fontSize: 14, color: academyDGray),
                hintText: "Kullanıcı Ara"),
          ),
        ),
      ),
      body: Container(
        color: bgColor,
        child: _foundedUsers.isNotEmpty
            ? ListView.builder(
                itemCount: _foundedUsers.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: const SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: userComponent(user: _foundedUsers[index]),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Archive',
                        color: Colors.transparent,
                        icon: Icons.archive,
                        onTap: () => print("archive"),
                      ),
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.transparent,
                        icon: Icons.share,
                        onTap: () => print('Share'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'More',
                        color: Colors.transparent,
                        icon: Icons.more_horiz,
                        onTap: () => print('More'),
                      ),
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.transparent,
                        icon: Icons.delete,
                        onTap: () => print('Delete'),
                      ),
                    ],
                  );
                })
            : const Center(
                child: Text(
                "Kullanıcı Bulunamadı",
                style: TextStyle(color: academyBlack),
              )),
      ),
    );
  }

  userComponent({required UserK user}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileUI(user)));
            },
            child: Row(children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(user.image),
                  )),
              const SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(user.adSoyad,
                    style: const TextStyle(
                        color: academyBlack, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 5,
                ),
                Text(user.eslesmeOrani,
                    style: const TextStyle(color: academyDGray)),
              ])
            ]),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                user.isFollowedByMe = !user.isFollowedByMe;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: user.isFollowedByMe ? academyYellow : academyBlue,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: user.isFollowedByMe
                          ? Colors.transparent
                          : academyDGray,
                    )),
                child: Center(
                    child: Text(
                        user.isFollowedByMe ? 'Takipten Çık' : 'Takip Et',
                        style: TextStyle(
                            color: user.isFollowedByMe
                                ? Colors.white
                                : Colors.white)))),
          )
        ],
      ),
    );
  }
}
