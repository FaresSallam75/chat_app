import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPref;

  Future<MyServices> init() async {
    await Firebase.initializeApp();
    sharedPref = await SharedPreferences.getInstance();
    return this;
  }

  
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
