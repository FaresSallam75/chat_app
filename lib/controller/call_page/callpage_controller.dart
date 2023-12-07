import 'package:get/get.dart';

class CallPageController extends GetxController {
  int currentButton = 0;


  @override
  onInit() {
    super.onInit();
    
  }

  changeButton(int index) {
    currentButton = index;
    update();
  }
}
