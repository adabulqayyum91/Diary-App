import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController{
 final  selected ="Ali".obs;
  final List<String> mychildern = <String>["Ali","Hashim","Ahmed","Micheal Hopkinson"];
  final  time = DateTime.now().obs;
 final month = DateFormat('MMM').format(DateTime.now()).obs;
 final day = DateFormat('EEEE').format(DateTime.now()).obs;

  void setdropdown(String value){
    selected.value = value;
  }
   setdatetime(BuildContext context){
   showModalBottomSheet(context: context, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),builder: (_){
    return Container(
     height: 250,
      child: Center(
        child: CupertinoDatePicker(
         initialDateTime: time.value,
         maximumYear: 2022,
         minimumYear: 2016,
         mode: CupertinoDatePickerMode.date,
         onDateTimeChanged: (value){
          time.value = value;
          month.value = DateFormat('MMM').format(time.value);
          day.value = DateFormat('EEEE').format(time.value);
         },

        ),
      ),
    );
   });

  }

}