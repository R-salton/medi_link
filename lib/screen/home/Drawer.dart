
import 'package:flutter/material.dart';
import 'package:medicare/common/color_extension.dart';

class SideNav extends StatelessWidget {
  const SideNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: TColor.bg,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: TColor.primary,
              // image: DecorationImage(
              //   image: AssetImage("assets/images/umuhinzi.png"),
              //   fit: BoxFit.cover,
              // ),
            ),
            arrowColor: Colors.white,
            accountName: const Text(
              "Salton",
              
            ),
            accountEmail: const Text(
              "nezasalton@gmail.com",
              
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/img/u3.png",
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const NavTile(
            title: "Home",
            icon: Icons.home,
          ),
          const NavTile(
            title: "Favourites",
            icon: Icons.favorite,
          ),
          const NavTile(
            title: "News",
            icon: Icons.newspaper,
            
          ),
          ListTile(
            title: const Text(
              "Favourites",
              
            ),
            leading:  Icon(
              Icons.notifications,
              color: TColor.primary,
            ),
            trailing: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                  child: Text(
                "8",
                
              )),
            ),
          ),
          const NavTile(
            title: "Profile",
            icon: Icons.person,
          ),
          const NavTile(
            title: "Settings",
            icon: Icons.settings,
          ),
          const NavTile(
            icon: Icons.logout, title: "Logout"),
        ],
      ),
    );
  }
}




// class SideMenu Tiles

class NavTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  const NavTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: TColor.primary,
      ),
      title: Text(
        title,
        
      ),
      onTap: () {
        // Navigator.pop(context);
      },
    );
  }
}