import 'package:akademi_kariyer/components/drawer/bottom_user_info.dart';
import 'package:akademi_kariyer/components/drawer/custom_list_tile.dart';
import 'package:akademi_kariyer/constants/colors.dart';
import 'package:akademi_kariyer/view/my_profile_screen.dart';
import 'package:akademi_kariyer/view/my_projects_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: _isCollapsed ? 300 : 70,
        margin: const EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: bgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyProfileScreen())),
                child: IgnorePointer(
                  child: CustomListTile(
                    isCollapsed: _isCollapsed,
                    icon: (Icons.person),
                    color: academyBlue,
                    title: 'Profil',
                    infoCount: 0,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyProjectsScreen())),
                child: IgnorePointer(
                  child: CustomListTile(
                    color: academyGreen,
                    isCollapsed: _isCollapsed,
                    icon: Icons.file_copy_rounded,
                    title: 'Projelerim',
                    infoCount: 3,
                  ),
                ),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.calendar_today,
                color: academyYellow,
                title: 'Takvim',
                infoCount: 0,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.message_rounded,
                color: academyRed,
                title: 'Mesajlar',
                infoCount: 8,
              ),
              const Divider(color: academyDGray),
              const Spacer(),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.notifications,
                color: Colors.black,
                title: 'Bildirimler',
                infoCount: 2,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.settings,
                color: Colors.black,
                title: 'Ayarlar',
                infoCount: 0,
              ),
              const SizedBox(height: 10),
              BottomUserInfo(isCollapsed: _isCollapsed),
              Align(
                alignment: _isCollapsed
                    ? Alignment.bottomRight
                    : Alignment.bottomCenter,
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(
                    _isCollapsed
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    color: academyBlack,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
