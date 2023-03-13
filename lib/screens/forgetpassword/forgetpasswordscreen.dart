import 'package:diary/Widgets/customtextfield.dart';
import 'package:diary/res/customfonts.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class ForgetPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: size.width*0.02,top: size.height*0.02),
              child: Row(
                children: [
                  BackButton(onPressed: (){
                    Get.offNamed("/login");
                  },),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Padding(
                padding:  EdgeInsets.only(left: size.width*0.07,top: size.height*0.02),
                child: Row(
                  children: [

                    Image.asset("assets/images/logocolors.png"),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: size.width*0.07,top: size.height*0.04),
              child: Row(
                children: [
                  Text("Forgot Password",style: TextStyle(fontFamily: sfprodisplay,color: Color(0xFF253274),fontWeight: FontWeight.w500,fontSize: size.width*0.08),)
                ],
              ),),
            Padding(padding: EdgeInsets.only(left: size.width*0.07,top: size.height*0.04,right: size.width*0.07)
              ,child: CustomTextfield(size: size,textInputType:  TextInputType.phone,hint: "03XXXXXXXXX",ispassword: false,valid: "Please Enter Your Phone Number",label: "PHONE",textEditingController: phoneController,),
            ),
            Padding(padding: EdgeInsets.only(left: size.width*0.07,top: size.height*0.04,right: size.width*0.07,),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        if(_formKey.currentState.validate()){
                          Get.offNamed("/login");
                        }
                      },
                      child: Container(
                        height: size.height*0.09,
                        decoration: BoxDecoration(
                            color: Color(0xff7189FF),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:  Center(child: Text("Send",style: TextStyle(color: Color(0xFFffffff),fontWeight: FontWeight.w600,fontSize: size.width*0.05),)),
                      ),
                    ),
                  )
                ],
              ),),
            Flexible(flex: 4,fit: FlexFit.tight,child: SizedBox(),),
            Flexible(flex: 8,fit: FlexFit.loose,child: Image.asset("assets/images/loginstyle.png",width: size.width,fit: BoxFit.cover,))
          ],
        ),
      ),
    );
  }
}
