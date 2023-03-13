import 'dart:io';

import 'package:diary/screens/teacherhomescreen/homescreen.dart';
import 'package:diary/screens/teachernotificationscreen/notificationscreen.dart';
import 'package:diary/screens/teacherprofile/profilescreen.dart';
import 'package:diary/teacherdairycontroller/BottomNavbarcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class TeacherBottomNavScreen extends StatelessWidget {
  final NavController navController = Get.put(NavController());


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Obx(
        () => CupertinoTabScaffold(
          backgroundColor: Color(0xFFFAF9F9),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (context) {
                    return CupertinoPageScaffold(child: Center(child:TeacherHomeScreen(),));
                  },
                );
              case 1:
                return CupertinoTabView(
                  builder: (context) {
                    return CupertinoPageScaffold(child: TeacherNotificationScreen());
                  },
                );
              case 2:
                return CupertinoTabView(
                  builder: (context) {
                    return CupertinoPageScaffold(child: TeacherProfileScreen());
                  },
                );
            }
          },
          tabBar: CupertinoTabBar(
              activeColor: Color(0xFF6454B6),
              inactiveColor: Color(0xffCCCCD4),
              backgroundColor: Color(0xffFAF9F9),
              border: Border.all(color: Colors.transparent),
              iconSize: 18,
              items: [
                BottomNavigationBarItem(
                    title: navController.selectedIndex == 0
                        ? Text(
                            "•",
                            style: TextStyle(fontSize: 20),
                          )
                        : Text(
                            "•",
                            style: TextStyle(
                                fontSize: 18, color: Colors.transparent),
                          ),
                    icon: ImageIcon(
                      AssetImage("assets/images/homeicon.png"),
                    )),
                BottomNavigationBarItem(
                    title: navController.selectedIndex == 1
                        ? Text(
                            "•",
                            style: TextStyle(fontSize: 20),
                          )
                        : Text(
                            "•",
                            style: TextStyle(
                                fontSize: 18, color: Colors.transparent),
                          ),
                    icon: ImageIcon(
                      AssetImage("assets/images/bellicon.png"),
                    )),
                BottomNavigationBarItem(
                    title: navController.selectedIndex == 2
                        ? Text(
                            "•",
                            style: TextStyle(fontSize: 20),
                          )
                        : Text(
                            "•",
                            style: TextStyle(
                                fontSize: 18, color: Colors.transparent),
                          ),
                    icon: ImageIcon(
                      AssetImage("assets/images/person.png"),
                    )),
              ],
              currentIndex: navController.selectedIndex,
              onTap: (index) {
                navController.selectedIndex = index;
              }),
        ),
      ),
    );
  }
}
/*

body: Obx(() => bodyContent.elementAt(navController.selectedIndex)),
bottomNavigationBar: Obx(() => BottomNavigationBar(
backgroundColor: Color(0xffFAF9F9),
elevation: 0,
iconSize: 20,

selectedFontSize: 20,
unselectedFontSize: 20,
unselectedItemColor: Color(0xffCCCCD4),
items: [
BottomNavigationBarItem(
title: navController.selectedIndex==0?Text("•"):Text(""),
icon: ImageIcon(
AssetImage("assets/images/homeicon.png"),
)),
BottomNavigationBarItem(
title: navController.selectedIndex==1?Text("•"):Text(""),

icon: ImageIcon(
AssetImage("assets/images/bellicon.png"),
)),
BottomNavigationBarItem(
title: navController.selectedIndex==2?Text("•"):Text(""),

icon: ImageIcon(
AssetImage("assets/images/person.png"),
)),
],
selectedItemColor: Color(0xFF6454B6),
currentIndex: navController.selectedIndex,
onTap: (index)=> navController.selectedIndex = index,
)),*/
