import 'dart:convert';

import 'package:diary/res/customfonts.dart';
import 'package:diary/screens/teacherbulkdiary/bulkdiaryscreen.dart';
import 'package:diary/screens/teacherhomescreen/subjectdata.dart';
import 'package:diary/screens/teacherstudentsdiary/studentdiaryscreen.dart';
import 'package:diary/teacherdairycontroller/homecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';


class TeacherHomeScreen extends StatelessWidget {
  //var date = DateTime.now();
  final HomeController homeController = Get.put(HomeController());
  int subjects = subjectdata().length;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F9),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, right: 30, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () => homeController.setdatetime(context),
                    child: Row(
                      children: [
                        Text(
                          homeController.time.value.day.toString(),
                          style: TextStyle(
                              fontFamily: sfprodisplay,
                              fontSize: size.width * 0.1,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF253274)),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${homeController.day.value.toString()}",
                              style: TextStyle(
                                  fontFamily: sfprodisplay,
                                  fontWeight: FontWeight.w400,
                                  fontSize: size.width * 0.04,
                                  color: Color(0xff253274).withOpacity(0.6)),
                            ),
                            Text(
                              "${homeController.month.value.toString()} ${homeController.time.value.year.toString()}",
                              style: TextStyle(
                                  fontFamily: sfprodisplay,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff253274).withOpacity(0.6),
                                  fontSize: size.width * 0.04),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/mylogo.png",
                  height: 60,
                  width: 28,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 64,
                  decoration: BoxDecoration(
                    color: Color(0xff6454B6),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 33, right: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() => DropdownButton(
                                  underline: Container(
                                    color: Color(0xFF6454B6),),
                                  dropdownColor: Color(0xff6454B6),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: size.width * 0.04,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  value: homeController.selected.value,
                                  items: homeController.sections.map((mysections) {
                                    return DropdownMenuItem(
                                        value: mysections,
                                        child: Text(
                                          mysections,
                                          style: TextStyle(
                                              fontSize: size.width * 0.05,
                                              fontFamily: sfprodisplay,
                                              color: Color(0xffffffff)),
                                        ));
                                  }).toList(),
                                  onChanged: (value) {
                                    homeController.setdropdown(value);
                                  },
                                  elevation: 0,
                                )),
                            GestureDetector(
                              onTap: (){
                                Get.to(BulkDiaryScreen(classname: homeController.selected.value,));
                                },
                              child: Text(
                                "Bulk Diary",
                                style: TextStyle(
                                    fontSize: size.width * 0.045,
    decoration: TextDecoration.underline,
                                    color: Color(0xfFffffff).withOpacity(0.5)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFffffff),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: ListView.builder(itemCount: subjectdata().length,itemBuilder: (BuildContext context , int index){
                      var mydata = subjectdata()[index];
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only( left: 23),

                            child: ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherStudentDiaryScreen(image: mydata.studentimage,name: mydata.studentname,sclass: homeController.selected.value,)));
                              },
                              leading: CircleAvatar(child: Image.asset(mydata.studentimage),radius: size.width*0.06,),
                              title: Text(mydata.studentname,style: TextStyle(fontFamily: sfprodisplay,fontSize: size.width*0.04,color: Color(0xFF253274)),),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Container(color: Color(0xFF000000).withOpacity(0.2),height: 1,),
                          SizedBox(height: 8,),

                        ],
                      );
                    }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
} /*
*/
