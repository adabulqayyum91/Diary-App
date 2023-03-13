import 'dart:io';

import 'package:diary/Widgets/customtextfield.dart';
import 'package:diary/res/customfonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String teachernumber = "12341234";
  String parentnumber = "43214321";
  String teacherpass = "12341234";
  String parentpass = "43214321";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.07, top: size.height * 0.05),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/logocolors.png",
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.07, top: size.height * 0.04),
                  child: Row(
                    children: [
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontFamily: sfprodisplay,
                            color: Color(0xFF253274),
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.08),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.07,
                      top: size.height * 0.04,
                      right: size.width * 0.07),
                  child: CustomTextfield(
                    size: size,
                    textInputType: TextInputType.phone,
                    hint: "03XXXXXXXXX",
                    ispassword: false,
                    valid: "Please Enter Your Phone Number",
                    label: "PHONE",
                    textEditingController: phoneController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.07,
                      top: size.height * 0.02,
                      right: size.width * 0.07),
                  child: CustomTextfield(
                    size: size,
                    hint: "***********",
                    textInputType: TextInputType.text,
                    ispassword: true,
                    valid: "Please Enter Your Password",
                    label: "PASSWORD",
                    textEditingController: passwordController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.07,
                    top: size.height * 0.02,
                    right: size.width * 0.07,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.toNamed("/forgetpass");
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontFamily: sfprodisplay,
                                color: Color(0xFF7C84AC),
                                fontSize: size.width * 0.035),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.07,
                    top: size.height * 0.005,
                    right: size.width * 0.07,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (_formKey.currentState.validate() &&
                                passwordController.text == parentpass &&
                                phoneController.text == parentnumber) {
                              Get.toNamed("/bottomNavscreen");
                            } else if (_formKey.currentState.validate() &&
                                passwordController.text == teacherpass &&
                                phoneController.text == teachernumber) {
                              Get.toNamed("/teacherbottomNavscreen");
                            }
                            else if(phoneController.text.isEmpty == false && passwordController.text.isEmpty == false){
                               final snake = SnackBar(duration: Duration(seconds: 4),elevation: 0,backgroundColor: Colors.red[400],content: Container(
                                 child: Row(
                                    children: [
                                      Icon(Icons.warning_amber_sharp,color: Colors.white,),
                                      SizedBox(width: 10,),
                                      Text("Invalid User",style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                               ),);
                               ScaffoldMessenger.of(context).showSnackBar(snake);
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xff7189FF),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "Log In",
                              style: TextStyle(
                                  color: Color(0xFFffffff),
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.05),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: SizedBox(),
                ),
                Flexible(
                    flex: 7,
                    fit: FlexFit.loose,
                    child: Image.asset(
                      "assets/images/loginstyle.png",
                      fit: BoxFit.cover,
                      width: size.width,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
