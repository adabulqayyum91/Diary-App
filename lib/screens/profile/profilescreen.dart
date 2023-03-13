import 'package:diary/screens/changepassword/changepassword%20screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'multipleprofiles.dart';
import 'profilepersonscreen/profilepersonscreen.dart';

class ProfileScreen extends StatelessWidget {
  get sfprodisplay => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F9),
      body: Column(
        children: [
            Padding(
              padding: EdgeInsets.only(left: 36,top: 60),
              child: Row(
                children: [
                  Text("Profile",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: sfprodisplay,color: Color(0xFF253274),fontSize: size.width*0.075),),
                ],
              ),
            )
       ,SizedBox(height: 16,),
          Expanded(
            child: Container(decoration: BoxDecoration(
              color: Color(0xFF6454B6),
              borderRadius: BorderRadius.circular(20),
            ),
              child: ListView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: allprofile().length,
                    itemBuilder: (context,int index){
                      var mydata = allprofile()[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,),
                            child: ListTile(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>
                                    ProfilePersonScreen(i: index,image: mydata.image,name: mydata.name,age: mydata.age,section: mydata.section,studentclass: mydata.studentclass,subjects: mydata.subjects,)));
                              },
                            title: Text(mydata.name,style: TextStyle(color: Color(0xFFFFFFFF,),fontFamily: sfprodisplay,fontSize: size.width*0.035),),
                              leading: CircleAvatar(radius: size.width*0.05,
                                child: Image.asset(mydata.image),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,size: size.width*0.05,),
                            ),
                          ),
                          Divider(height: 0.5,thickness: 0.5,color: Color(0xFFFFFFFF).withOpacity(0.2),)

                        ],
                      );
                    },

                  ),
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 16,left: 36),
                    shrinkWrap: true,
                    children: [
                      Row(
                         children: [
                           Text("Settings",style: TextStyle(fontSize: size.width*0.035,fontFamily: sfprodisplay,color: Color(0xFFFFFFFF).withOpacity(0.6)),),
                         ],
                       ),
                      SizedBox(height: 16,),
                      GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            ChangePasswordScreen()));

                      }
                      ,child: Row(
                          children: [
                            Text("Change Password",style: TextStyle(fontSize: size.width*0.035,fontFamily: sfprodisplay,color: Color(0xFFFFFFFF)),),
                          ],
                        ),
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text("Terms & Conditions",style: TextStyle(fontSize: size.width*0.035,fontFamily: sfprodisplay,color: Color(0xFFFFFFFF)),),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text("Privacy Policy",style: TextStyle(fontSize: size.width*0.035,fontFamily: sfprodisplay,color: Color(0xFFFFFFFF)),),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text("Sign Out",style: TextStyle(fontSize: size.width*0.035,fontFamily: sfprodisplay,color: Color(0xFFFFFFFF)),),
                        ],
                      ),
                      SizedBox(height: 16,),
                    ],
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
