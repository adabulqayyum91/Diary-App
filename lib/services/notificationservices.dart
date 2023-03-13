/*

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class PushNotificationService {


RemoteMessage initiate;
 getinitialize() async {
   initiate = await FirebaseMessaging.instance.getInitialMessage();
   if(initiate.data['type']=='bottom'){
     Get.toNamed('/bottomNavscreen');
   }
   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
     if (message.data['type'] == 'bottom') {
       Get.toNamed('/bottomNavscreen');
     }
   });
 }



}*/
