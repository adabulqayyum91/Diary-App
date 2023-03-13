import 'package:diary/res/customfonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'Studentdiarydata.dart';

class TeacherStudentDiaryScreen extends StatelessWidget {
  String name;
  String image;
  String sclass;
  TeacherStudentDiaryScreen({this.image, this.name, this.sclass});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFAF9F9),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, right: 20, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios_rounded),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Text(name,
                        style: TextStyle(
                            color: Color(0xFF253274),
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.06)),
                  ],
                ),
                CircleAvatar(
                  child: Image.asset(image),
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
                            Text(
                              sclass,
                              style: TextStyle(
                                  fontSize: size.width * 0.045,
                                  color: Color(0xffffffff)),
                            ),
                            GestureDetector(
                              onTap: () {
                                adddiarydialog(context);
                              },
                              child: Text(
                                "Add New Diary",
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: ListView(
                        children: [
                          Row(
                            children: [
                              Container(
                                  width: size.width * 0.2,
                                  child: Text(
                                    "Date",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: sfprodisplay,
                                        fontSize: size.width * 0.045,
                                        color:
                                            Color(0xff253274).withOpacity(0.6)),
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
                              itemCount: subjectdata().length,
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
                                              textAlign: TextAlign.center,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width * 0.035,
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              mydata.subjectdetails.length,
                                          itemBuilder:
                                              (BuildContext context, int i) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      left: BorderSide(
                                                          width: 1,
                                                          color:
                                                              Color(0xFF707070)
                                                                  .withOpacity(
                                                                      0.2)))),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: size.width * 0.03,
                                                    right: 30,
                                                    bottom: 10),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: mydata.mycolor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Text(
                                                        mydata
                                                            .subjectdetails[i],
                                                        style: TextStyle(
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            color: Color(
                                                                0xFF253274),
                                                            fontSize:
                                                                size.width *
                                                                    0.045),
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  adddiarydialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Color(0xFFFFFFFF),
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Diary",
                            style: TextStyle(
                                color: Color(0xff7C84AC),
                                fontFamily: sfprodisplay,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.19,
                      child: TextField(
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: "Write diary here...",
                          hintStyle: TextStyle(
                              color: Color(0xFF253274).withOpacity(0.3)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xFFC3C6D8))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: sfprodisplay,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF253274)),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text("Save",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: sfprodisplay,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF253274),
                                  ))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
