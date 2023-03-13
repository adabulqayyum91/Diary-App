import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BulkDiaryController extends GetxController{
  List   select = [].obs;
  final List check = <bool>[].obs;
  final textfieldcontroller = TextEditingController().obs;

  /*changingtextonfield(String value){
    value = value.toLowerCase();
    select = select.where((mylist){
      var notelist = mylist.name.toLowerCase();
      return  notelist.contains(value);
    }).toList();

  }*/
/*@override
  void onInit() {
    for(int v = 0 ; v<bulkstudentdata().length;v++){
      check.add(false);
    }
    print(check);
    super.onInit();
  }*/
}