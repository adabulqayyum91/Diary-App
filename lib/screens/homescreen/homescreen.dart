import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:diary/controller/homecontroller.dart';
import 'package:get/get.dart';
import 'package:diary/res/customfonts.dart';
import 'package:diary/screens/homescreen/subjectdata.dart';

class HomeScreen extends StatelessWidget {
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
                                    color: Color(0xFF6454B6),
                                  ),
                                  dropdownColor: Color(0xff6454B6),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: size.width * 0.06,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  value: homeController.selected.value,
                                  items: homeController.mychildern.map((mychild) {
                                    return DropdownMenuItem(
                                        value: mychild,
                                        child: Text(
                                          mychild,
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
                            Text(
                              "Class: 3-A",
                              style: TextStyle(
                                  fontSize: size.width * 0.045,
                                  color: Color(0xfFffffff).withOpacity(0.5)),
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
                    child: Padding(
                      padding: const EdgeInsets.only( left: 23),
                      child: ListView(
                        children: [
                          Row(
                            children: [
                              Container(
                                  width: size.width * 0.2,
                                  child: Text(
                                    "Subjects",
                                    style: TextStyle(
                                        fontFamily: sfprodisplay,
                                        fontSize: size.width * 0.045,
                                        color: Color(0xff253274).withOpacity(0.6)),
                                  )),
                              SizedBox(
                                width: size.width * 0.065,
                              ),
                              Text(
                                "Work",
                                style: TextStyle(
                                    fontFamily: sfprodisplay,
                                    fontSize: size.width * 0.045,
                                    color: Color(0xff253274).withOpacity(0.6)),
                              ),
                            ],
                          ),
                          ListView.builder(
                              padding: EdgeInsets.only(top: 5),
                              itemCount: subjects,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                var mydata = subjectdata()[index];
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                            width: size.width * 0.2,
                                            child: Text(
                                              mydata.subjectname,
                                              style: TextStyle(
                                                  fontFamily: sfprodisplay,
                                                  fontSize: size.width * 0.045,
                                                  color: Color(0xff253274)),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width * 0.035,

                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: ListView.builder(

                                          physics: NeverScrollableScrollPhysics(),

                                          shrinkWrap: true,
                                          itemCount: mydata.subjectdetails.length,
                                          itemBuilder:
                                              (BuildContext context, int i) {
                                            return Container(
                                              decoration: BoxDecoration(border: Border(left: BorderSide(width: 1,color: Color(0xFF707070).withOpacity(0.2)))),
                                              child: Padding(
                                                padding:  EdgeInsets.only(
                                                   left: size.width*0.03, right: 30, bottom: 10),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: mydata.mycolor,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
                                                      child: Text(
                                                        mydata.subjectdetails[i],
                                                        style: TextStyle(
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            color: Color(0xFF253274),
                                                            fontSize:
                                                                size.width * 0.045),
                                                      ),
                                                    )),
                                              ),
                                            );
                                          }),
                                    )
                                  ],
                                );
                              })
                        ],
                      ),
                    ),
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
