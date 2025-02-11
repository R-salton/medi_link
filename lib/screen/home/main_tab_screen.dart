import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medicare/common/color_extension.dart';
import 'package:medicare/common_widget/Nvigation.dart';

import 'package:medicare/screen/home/Drawer.dart';
import 'package:medicare/screen/home/doctor_profile_screen.dart';
import 'package:medicare/screen/home/home_tab_screen.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int selectTab = 0;
  final GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey();

  int _pageIndex = 2;

  List menuArr = [
    {'name': 'My Appointments', 'icon': 'assets/img/my_apo.png', 'action': '1'},
    {
      'name': 'New Appointment',
      'icon': 'assets/img/new_app.png',
      'action': '2'
    },
    {'name': 'Medical Records', 'icon': 'assets/img/recode.png', 'action': '3'},
    {'name': 'Forum', 'icon': 'assets/img/forum.png', 'action': '4'},
    {
      'name': 'Account Settings',
      'icon': 'assets/img/account_setting.png',
      'action': '5'
    },
    {'name': 'Help', 'icon': 'assets/img/help.png', 'action': '6'},
    {'name': 'Logout', 'icon': 'assets/img/logout.png', 'action': '7'}
  ];

  @override
  void initState() {

    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller.addListener(() {
      setState(() {
        selectTab = controller.index;
      });
    });
  }

  @override
  void dispose() {

    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
    title: 'Home',
  ),
  TabItem(
    icon: Icons.search_sharp,
    title: 'Shop',
  ),
  // TabItem(
  //   icon: Icons.favorite_border,
  //   title: 'Wishlist',
  // ),
  // TabItem(
  //   icon: Icons.shopping_cart_outlined,
  //   title: 'Cart',
  // ),
  // TabItem(
  //   icon: Icons.account_box,
  //   title: 'profile',
  // ),
];

 int visit = 0;
  double height = 30;
  Color colorSelect =const Color(0XFF0686F8);
  Color color = const Color(0XFF7AC0FF);
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const  Color(0XFF1752FE);

    return Scaffold(
      key: scaffoldStateKey, 
      drawer: const SideNav(),
      
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            scaffoldStateKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            size: 35,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Medicare",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: TColor.primaryText,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Surat",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        // padding:const EdgeInsets.only(bottom: 30, right: 32, left: 32),
        decoration: BoxDecoration(
          color: TColor.primary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: BottomBarFloating(
          items: items,
          backgroundColor: Colors.transparent,
          color: Colors.white,
          colorSelected: Colors.orange,
          indexSelected: visit,
          paddingVertical: 24,
          onTap: (int index) => setState(() {
            visit = index;
            // controller.index = index;
          }),
        ),
      ), 
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 15,
              decoration: BoxDecoration(
                  color: TColor.primary,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
            ),
            Expanded(
              child: TabBarView(controller: controller, children: [
                HomeTabScreen(),
                DoctorProfileScreen(),
                DoctorProfileScreen(),
                DoctorProfileScreen(),
                DoctorProfileScreen(),
              ]),
            ),
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     Container(
      //       width: double.maxFinite,
      //       height: 15,
      //       decoration: BoxDecoration(
      //           color: TColor.primary,
      //           borderRadius: const BorderRadius.only(
      //               bottomLeft: Radius.circular(15),
      //               bottomRight: Radius.circular(15))),
      //     ),
      //     Expanded(
      //       child: TabBarView(controller: controller, children: [
      //         HomeTabScreen(),
      //         DoctorProfileScreen(),
             
      //       ]),
      //     ),

          
      //   ],
      // ),
      // bottomNavigationBar: CurvedNavigationBar(
        
      //     height: 75, 
      //     index: _pageIndex,
      //     letIndexChange: (index) => true,
      //     backgroundColor: Colors.transparent,
      //     buttonBackgroundColor: TColor.primary,
      //     color: TColor.primary,
      //     items: [
            
      //       Container(
      //         padding: const EdgeInsets.all(5),
      //         height: 50,
      //         width: 50,
      //         decoration: BoxDecoration(
      //           color: TColor.primary,
      //           borderRadius: BorderRadius.circular(50),
      //         ),
      //         child: Center(
      //           child: Image.asset(
      //             "assets/img/calendar.png",
      //             width: 30,
      //             height: 30,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         padding: const EdgeInsets.all(5),
      //         height: 50,
      //         width: 50,
      //         decoration: BoxDecoration(
      //           color: TColor.primary,
      //           borderRadius: BorderRadius.circular(50),
      //         ),
      //         child: Center(
      //           child: Image.asset(
      //             "assets/img/user.png",
      //             width: 30,
      //             height: 30,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         padding: const EdgeInsets.all(5),
      //         height: 50,
      //         width: 50,
      //         decoration: BoxDecoration(
      //           color: TColor.primary,
      //           borderRadius: BorderRadius.circular(50),
      //         ),
      //         child: Center(
      //           child: Image.asset(
      //             "assets/img/home.png",
      //             width: 35,
      //             height: 35,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         padding: const EdgeInsets.all(5),
      //         height: 50,
      //         width: 50,
      //         decoration: BoxDecoration(
      //           color: TColor.primary,
      //           borderRadius: BorderRadius.circular(50),
      //         ),
      //         child: Center(
      //           child: Image.asset(
      //             "assets/img/bulb.png",
      //             width: 30,
      //             height: 30,
      //           ),
      //         ),
      //       ),
      //        Container(
      //         padding: const EdgeInsets.all(5),
      //         height: 50,
      //         width: 50,
      //         decoration: BoxDecoration(
      //           color: TColor.primary,
      //           borderRadius: BorderRadius.circular(50),
      //         ),
      //         child: Center(
      //           child: Image.asset(
      //             "assets/img/user.png",
      //             width: 30,
      //             height: 30,
      //           ),
      //         ),
      //       ),
      //     ],
      //     animationCurve: Curves.easeInOut,
      //     animationDuration: const Duration(milliseconds: 300),
      //     onTap: (index) {
      //       setState(() {
      //         _pageIndex = index;
      //       });
      //     },
      //     // onDestinationSelected: (value) {},
      //   ),
    
    
    );
  }
}


