import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/userk.dart';

class ProfileUI extends StatefulWidget {
  final UserK user;

  const ProfileUI(this.user, {Key? key}) : super(key: key);

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Hakkında',
          style: TextStyle(
              fontFamily: 'Oswald', fontSize: 20, color: Colors.white),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/gorseller/cover2.png'),
                ),
                Positioned(
                  bottom: -30.0,
                  child: SizedBox(
                    width: 180,
                    height: 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        widget.user.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: Center(
                  child: Text(
                widget.user.adSoyad,
                style: const TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 20,
                ),
              )),
              subtitle: Center(
                  child: Text(
                widget.user.alan,
                style: const TextStyle(fontFamily: 'Oswald2'),
              )),
            ),
            ListTile(
              title: const Text(
                'Hakkında',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                widget.user.hakkinda,
                style: const TextStyle(fontFamily: 'Oswald2', letterSpacing: 1),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaIcon(FontAwesomeIcons.angular, size: 40),
                SizedBox(width: 20),
                FaIcon(FontAwesomeIcons.js, size: 40),
                SizedBox(width: 20),
                FaIcon(FontAwesomeIcons.react, size: 40),
                SizedBox(width: 20),
                FaIcon(FontAwesomeIcons.nodeJs, size: 40),
                SizedBox(width: 20),
                FaIcon(FontAwesomeIcons.java, size: 40),
                SizedBox(width: 20),
                FaIcon(FontAwesomeIcons.html5, size: 40),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.slack,
                    size: 20,
                  ),
                  label: const Text(
                    'Slack',
                    style: TextStyle(fontFamily: 'Oswald2', fontSize: 10),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedin,
                    size: 20,
                  ),
                  label: const Text(
                    'LinkedIn',
                    style: TextStyle(fontFamily: 'Oswald2', fontSize: 10),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    size: 20,
                  ),
                  label: const Text(
                    'GitHub',
                    style: TextStyle(fontFamily: 'Oswald2', fontSize: 10),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.phone,
                    size: 20,
                  ),
                  label: const Text(
                    'GSM',
                    style: TextStyle(fontFamily: 'Oswald2', fontSize: 10),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
