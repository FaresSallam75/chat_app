import 'package:chat_app/controller/story/story_controller.dart';
import 'package:chat_app/data/model/otherstoriesmodel.dart';
import 'package:chat_app/core/functions/services.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

abstract class StoryDetailsControllerImp extends GetxController {
  intialData();
  goToBack();
  performFunction();
}

class OtherStoryDetailsControllerImp extends StoryDetailsControllerImp {
  OtherStoriesModel? otherStoriesModel;
  MyServices myServices = Get.find();
  StoryController storyController = StoryController();
  StoryControllerImp storyControllerImp = Get.find();

  @override
  intialData() {
    otherStoriesModel = Get.arguments['otherStoriesModel'];
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  goToBack() {
    Get.back();
  }

  @override
  performFunction() {
    // TODO: implement performFunction
    throw UnimplementedError();
  }
}
