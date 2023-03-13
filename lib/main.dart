
import 'package:diary/screens/teacherbottomnavbarscreen/BottomNav.dart';
import 'package:diary/screens/teacherchangepassword/changepassword%20screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'screens/bottomnavbarscreen/BottomNav.dart';
import 'screens/changepassword/changepassword screen.dart';
import 'screens/forgetpassword/forgetpasswordscreen.dart';
import 'screens/loginscreen/loginscreen.dart';
import 'screens/splashscreen/splashscreen.dart';




void main()async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness:Brightness.light
  ));
  WidgetsFlutterBinding.ensureInitialized();
/*  await Firebase.initializeApp();

String token = await FirebaseMessaging.instance.getToken();
print(token);*/
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name:"/",page:() =>SplashScreen()),
        GetPage(name:"/login",page:() =>LoginScreen()),
        GetPage(name:"/bottomNavscreen",page:() =>BottomNavScreen()),
        GetPage(name: "/forgetpass", page:()=> ForgetPasswordScreen()),
        GetPage(name: "/changepass", page:()=> ChangePasswordScreen()),
        GetPage(name:"/teacherbottomNavscreen",page:() =>TeacherBottomNavScreen()),
        GetPage(name: "/teacherchangepass", page:()=> TeacherChangePasswordScreen()),

      ],
    );
  }
}

