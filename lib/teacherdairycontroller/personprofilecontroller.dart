

import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class PersonProfileController extends GetxController{
RxList name = ["","",""].obs;

ImagePicker imagePicker = ImagePicker();
File uimage;
  void changename(int index,String cname){
    name[index] = cname;
  }


void getimagefromgallery() async {
  var _image = await imagePicker.getImage(source: ImageSource.gallery);
  uimage = File(_image.path);
}

 getimagefromcamera() async {
  var _image = await imagePicker.getImage(source: ImageSource.camera);
  uimage = File(_image.path);
}

}

