import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:image_picker/image_picker.dart";
import 'package:diary/Widgets/customtextfield.dart';
import 'package:diary/controller/personprofilecontroller.dart';
import 'package:diary/res/customfonts.dart';

class ProfilePersonScreen extends StatelessWidget {
  String image;
  String name;
  String studentclass;
  String section;
  int age;
  int i;
  List subjects;
  ProfilePersonScreen(
      {this.name,
        this.i,
      this.image,
      this.subjects,
      this.age,
      this.section,
      this.studentclass});
  PersonProfileController personProfileController =
      Get.put(PersonProfileController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F9),
      body: GetBuilder(
        init: personProfileController,
        builder: (_){
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 35, left: 20.0,bottom: 20),
                child: Row(
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_back_ios, color: Color(0xFF253274)),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
          personProfileController.name[i] != ""
          ? personProfileController.name[i]
              : name,
                        style: TextStyle(
                            color: Color(0xFF253274),
                            fontFamily: sfprodisplay,
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Center(
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Image.asset(image,
                                        fit: BoxFit.cover,width: size.width*0.3,),
                                    InkWell(onTap: (){
                                      showpanel(context);
                                    },child: Container(height: 40,width: 40,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.deepPurple),alignment: Alignment.bottomRight,child: Center(child: Icon(Icons.camera_alt_outlined,color: Colors.white,size: size.width*0.065,))))
                                  ],
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 36,top: 40),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(
                                      color: Color(0xff7C84AC),
                                      fontFamily: sfprodisplay,
                                      fontSize: size.width * 0.03,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                   Text(
                                        personProfileController.name[i] != ""
                                            ? personProfileController.name[i]
                                            : name,
                                        style: TextStyle(
                                            color: Color(0xff253274),
                                            fontFamily: sfprodisplay,
                                            fontSize: size.width * 0.04),
                                      ),

                                    SizedBox(
                                      width: 2,
                                    ),
                                    InkWell(
                                        child: Icon(
                                          Icons.edit,
                                          color: Color(0xff253274),
                                          size: size.width * 0.04,
                                        ),
                                        onTap: () {
                                          namechangebottomsheet(context);
                                        })
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 36, top: 30),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Age",
                                  style: TextStyle(
                                      color: Color(0xff7C84AC),
                                      fontFamily: sfprodisplay,
                                      fontSize: size.width * 0.03,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "$age Years Old",
                                      style: TextStyle(
                                          color: Color(0xff253274),
                                          fontFamily: sfprodisplay,
                                          fontSize: size.width * 0.04),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 36, top: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Class",
                                    style: TextStyle(
                                        color: Color(0xff7C84AC),
                                        fontFamily: sfprodisplay,
                                        fontSize: size.width * 0.03,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        studentclass,
                                        style: TextStyle(
                                            color: Color(0xff253274),
                                            fontFamily: sfprodisplay,
                                            fontSize: size.width * 0.04),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Section",
                                    style: TextStyle(
                                        color: Color(0xff7C84AC),
                                        fontFamily: sfprodisplay,
                                        fontSize: size.width * 0.03,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        section,
                                        style: TextStyle(
                                            color: Color(0xff253274),
                                            fontFamily: sfprodisplay,
                                            fontSize: size.width * 0.04),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 36, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Subjects",
                              style: TextStyle(
                                  color: Color(0xff7C84AC),
                                  fontFamily: sfprodisplay,
                                  fontSize: size.width * 0.03,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: subjects.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      subjects[index],
                                      style: TextStyle(
                                          color: Color(0xff253274),
                                          fontFamily: sfprodisplay,
                                          fontSize: size.width * 0.04),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  namechangebottomsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return CustomBottomSheet(i:i);
        });
  }
  showpanel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height - 450,
            child: ListView(
              children: [
                   ListTile(
                    onTap: (){
                       personProfileController.getimagefromcamera();
                    },
                    leading: Icon(
                      Icons.camera_alt,
                      color: Colors.deepPurple[400],
                    ),
                    title: Text(
                      "Take a picture",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),

           ListTile(
             onTap: (){
               personProfileController.getimagefromgallery();
             },
                    leading: Icon(
                      Icons.panorama_horizontal_select,
                      color: Colors.greenAccent,
                    ),
                    title: Text(
                      "Choose image from gallery",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ListTile(
             onTap: (){
             },
                    leading: Icon(
                      Icons.delete,
                      color: Colors.red[400],
                    ),
                    title: Text(
                      "Remove the image",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),

              ],
            ),
          );
        });
  }

}

class CustomBottomSheet extends StatelessWidget {
  int i;
  CustomBottomSheet({this.i});
  TextEditingController controller = TextEditingController();
  PersonProfileController personProfileController =
      Get.put(PersonProfileController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 201,
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
                      "Name",
                      style: TextStyle(
                          color: Color(0xff7C84AC),
                          fontFamily: sfprodisplay,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 5,),
              Container(
                height: 70,
                child: Column(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xFFC3C6D8))),

                        ),
                        controller: controller,


                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
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
                          personProfileController.changename(i,controller.text);
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
  }

}
