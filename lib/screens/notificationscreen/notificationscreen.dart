import 'package:flutter/material.dart';
import 'package:diary/res/customfonts.dart';
import 'package:diary/screens/notificationscreen/NotificationData.dart';

class NotificationScreen extends StatelessWidget {
  int count = notificationdata().length;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffFAF9F9),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 30),
            child: Row(
              children: [
                Text(
                  "Notification",
                  style: TextStyle(
                      fontSize: size.width * 0.085,
                      fontWeight: FontWeight.bold,
                      fontFamily: sfprodisplay,
                      color: Color(0xFF253274)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.builder(
                    itemCount: count,
                    itemBuilder: (BuildContext context, int index) {
                      var notify = notificationdata()[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 24,left: 30,right: 30),
                            child: Text(
                              notify.title,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: size.width * 0.045,
                                  color: Color(0xFF253274)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 15,left: 30,right: 30),
                            child: Row(
                              children: [
                                Text(
                                  notify.date,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: size.width * 0.03,
                                      color: Color(0xFF253274).withOpacity(0.6)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Color(0xFF707070).withOpacity(0.2),
                          )
                        ],
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}

