import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  final _selectedIndex = 0.obs;

  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;
}