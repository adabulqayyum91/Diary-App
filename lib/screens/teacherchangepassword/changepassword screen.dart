import 'package:diary/Widgets/customtextfield.dart';
import 'package:diary/res/customfonts.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class TeacherChangePasswordScreen extends StatefulWidget {
  const TeacherChangePasswordScreen({Key key}) : super(key: key);

  @override
  _TeacherChangePasswordScreenState createState() => _TeacherChangePasswordScreenState();
}

class _TeacherChangePasswordScreenState extends State<TeacherChangePasswordScreen> {

  TextEditingController oldpass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController confirmnewpass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Color(0xFFFAF9F9),
      body: Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 45, left: 20.0,bottom: 20),
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
                    "Change Password",
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
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(20)),
              child: ListView(
                children: [
                  Padding(padding: EdgeInsets.only(left: size.width*0.07,top: size.height*0.02,right: size.width*0.07)
                    ,child: CustomTextfield(size: size,hint: "***********",textInputType: TextInputType.text,ispassword: true,valid: "Please Enter Your Old Password",label: "Old Password",textEditingController: oldpass,),
                  ),
                  Padding(padding: EdgeInsets.only(left: size.width*0.07,top: size.height*0.02,right: size.width*0.07)
                    ,child: CustomTextfield(size: size,hint: "***********",textInputType: TextInputType.text,ispassword: true,valid: "Please Enter Your New Password",label: "New Password",textEditingController: newpass,),
                  ),
                  Padding(padding: EdgeInsets.only(left: size.width*0.07,top: size.height*0.02,right: size.width*0.07)
                    ,child: CustomTextfield(size: size,hint: "***********",textInputType: TextInputType.text,ispassword: true,valid: "Please Confirm Your New Password",label: "Confirm New Password",textEditingController: confirmnewpass,),
                  ),
                  Padding(padding: EdgeInsets.only(left: size.width*0.07,top: size.height*0.04,right: size.width*0.07,),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              if(_formKey.currentState.validate()){
                                    Navigator.pop(context);
                              }
                            },
                            child: Container(
                              height: size.height*0.09,
                              decoration: BoxDecoration(
                                  color: Color(0xff7189FF),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child:  Center(child: Text("Reset Password",style: TextStyle(color: Color(0xFFffffff),fontWeight: FontWeight.w600,fontSize: size.width*0.05),)),
                            ),
                          ),
                        )
                      ],
                    ),),
                ],
              ),
            ),
          ))

        ],),
      ),
    );
  }
}
