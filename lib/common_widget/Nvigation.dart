import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:medicare/screen/home/main_tab_screen.dart';

class CurvedNavigation extends StatelessWidget {
  const CurvedNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(
      actionButton: CurvedActionBar(
          onTab: (value) {
            /// perform action here
            print(value);
          },
          activeIcon: Container(
            padding: const EdgeInsets.all(8),
            decoration:
                const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: const Icon(
              Icons.camera_alt,
              size: 50,
              color: Colors.orange,
            ),
          ),
          inActiveIcon: Container(
            padding: const EdgeInsets.all(8),
            decoration:
                const BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
            child: const Icon(
              Icons.camera_alt_outlined,
              size: 50,
              color: Colors.orange,
            ),
          ),
          text: "Camera"),
      activeColor: Colors.blue,
      navBarBackgroundColor: Colors.limeAccent,
      inActiveColor: Colors.black45,
      appBarItems: [
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.home,
              color: Colors.blue,
            ),
            inActiveIcon: const Icon(
              Icons.home,
              color: Colors.black26,
            ),
            text: 'Home'),
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.wallet_giftcard,
              color: Colors.blue,
            ),
            inActiveIcon: const Icon(
              Icons.wallet_giftcard,
              color: Colors.black26,
            ),
            text: 'Wallet'),
      ],
      bodyItems: [
       const MainTabScreen(),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.pinkAccent,
        )
      ],
      actionBarView: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.orange,
      ),
    );
  }
}